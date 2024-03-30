import pandas as pd
import statsmodels.api as sm
import statsmodels.genmod.families.links as links
from statsmodels.stats.multitest import fdrcorrection
import os

import seaborn as sns
from matplotlib import pyplot as plt


# define functions
def perform_mediation(formula_m, formula_y, data, treat, mediator):
    med = sm.stats.Mediation(formula_y, formula_m, treat, mediator).fit()
    print(med.summary())
    return med.summary()


def generate_fdr_table(medsum):
    ACMEp = medsum["P-value"]["ACME (average)"]
    ADEp = medsum["P-value"]["ADE (average)"]
    Totalp = medsum["P-value"]["Total effect"]
    MedP = medsum["P-value"]["Prop. mediated (average)"]

    fdrframe = pd.DataFrame({"ACME_pval": [ACMEp], "ADE_pval": [ADEp],
                             "Total_pval": [Totalp], "Med_pval": [MedP]})

    return fdrframe


def generate_missing_information(row_df, brainregion_name):
    formulaM = row_df["Formula 1"]
    formulaY = row_df["Formula 2"]

    formulaM = formulaM.replace(".", "_")
    formulaY = formulaY.replace(".", "_")

    mediator = formulaM.split("~")[0]
    y_covars = formulaY.split("~")[1]
    treat = y_covars.split(" ")[0]
    name = row_df["name"]

    df_missing = pd.DataFrame({"SNP": [treat], "GenExp": [mediator],
                               "GenExp_name": [name], "Region": [brainregion_name]})

    return df_missing




# Load data
basePath = "/data/humgen/daskalakislab/vincent/ScienceMediation/"
form_path = basePath + "Formulas.csv"
annofile = "/data/humgen/daskalakislab/ioulia/sciencePaper/Vincent/data/anno_GE_PTSD_MDD_ALLSNPs.csv"


# load data frames
df_anno = pd.read_csv(annofile)
df_form = pd.read_csv(form_path)

# Load dataframes
df = df_anno
df.columns = df.columns.str.replace(".", "_")

# define links
probit = links.probit

# define lists
results = []
fdrframes = []
missing = []


for disease in ["PTSD", "MDD"]:
    subset_df = df[(df['Dx'] == disease) | (df['Dx'] == "Control")]
    subset_df['Dx'] = subset_df['Dx'].apply(lambda x: 1 if x == disease else 0)  # Encoding 'Dx' as 1 for 'disease' and 0 for 'Control'
    subset_formula = df_form[df_form['Dx'] == disease]
    for brainregion in ["mPFC", "CentralAmyg", "DG"]:
        subset_region_df = subset_df[subset_df['Brain_Region'] == brainregion]
        for index, row in subset_formula.iterrows():
            try:

                formulaM = row["Formula 1"]
                formulaY = row["Formula 2"]

                formulaM = formulaM.replace(".", "_")
                formulaY = formulaY.replace(".", "_")

                mediator = formulaM.split("~")[0]
                y_covars = formulaY.split("~")[1]
                treat = y_covars.split(" ")[0]

                subset_region_df_filt = subset_region_df.dropna(subset=[mediator])
                print(len(subset_region_df_filt))

                savename = disease + "_" + mediator + "_" + treat + "_" + brainregion + "_medres.csv"
                savepath = os.path.join(basePath, "results", savename)
                if os.path.exists(savepath):
                    medres = pd.read_csv(savepath)
                    medres.index = ["ACME (control)", "ACME (treated)", "ADE (control)", "ADE (treated)",
                                    "Total effect", "Prop. mediated (control)", "Prop. mediated (treated)",
                                    "ACME (average)", "ADE (average)", "Prop. mediated (average)"]
                    fdrres = generate_fdr_table(medres)
                    fdrres["Dx"], fdrres["region"], fdrres["GenExp"], fdrres["SNP"] = disease, brainregion, mediator, treat
                    fdrres["gene"], fdrres["expname"], fdrres["snpname"] = row["genes"], row["name"], row["snp"]
                    fdrframes.append(fdrres)
                    results.append(medres)
                else:
                    lmY = sm.Logit.from_formula(formulaY, subset_region_df_filt)
                    print("LM-Y: " + formulaY)
                    lmM = sm.GLM.from_formula(formulaM, subset_region_df_filt)
                    print("LM-M: " + formulaM)

                    medres = perform_mediation(lmM, lmY, subset_region_df_filt,
                                               treat=treat,
                                               mediator=mediator)
                    medres["Dx"], medres["region"], medres["GenExp"], medres["SNP"] = disease, brainregion, mediator, treat
                    medres["gene"], medres["expname"] = row["genes"], row["name"]
                    medres.to_csv(savepath, index=False)
                    results.append(medres)
                    fdrres = generate_fdr_table(medres)
                    fdrres["Dx"], fdrres["region"], fdrres["GenExp"], fdrres["SNP"] = disease, brainregion, mediator, treat
                    fdrres["gene"], fdrres["expname"], fdrres["snpname"] = row["genes"], row["name"], row["snp"]
                    fdrframes.append(fdrres)

            except Exception as e:
                # Handle error here if needed
                print("Mediation not possible:")
                print(e)

                missing.append(generate_missing_information(row, brainregion))


results = pd.concat(results)
fdrframes = pd.concat(fdrframes)
missing = pd.concat(missing)

results.to_csv("/data/humgen/daskalakislab/vincent/ScienceMediation/medResults.csv")
missing.to_csv("/data/humgen/daskalakislab/vincent/ScienceMediation/missing.csv", index=False)

rej, correctedvals = fdrcorrection(fdrframes["Med_pval"], method='poscorr')
# results.to_csv("/data/humgen/daskalakislab/vincent/ScienceMediation/medResults.csv", index=False)
fdrframes["pval_fdrcorr"], fdrframes["decision_corr"] = correctedvals.T, rej.T
fdrframes.to_csv("/data/humgen/daskalakislab/vincent/ScienceMediation/fdRResults_prem.csv", index=False)


print('done')
