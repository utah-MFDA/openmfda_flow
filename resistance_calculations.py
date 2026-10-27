from file_generation import conc_ratio

if __name__ == "__main__":
    # all urinalysis assay specifications 
    assay_ls = ["albumin", "caffeine", "calcium", "cocaine", "ethyl", "ketone", "nitrite", "salicylic_acid"]
    num_samples_ls = [4, 3, 3, 3, 3, 2, 3, 4]
    input_dict_ls = [{"sample":6*10**(-6), "R1":215*10**(-6), "R2":25*10**(-6), "H2O":10*10**(-6)}, 
                     {"sample":3*10**(-6), "R1":162*10**(-6), "R2":162*10**(-6)}, 
                     {"sample":2*10**(-6), "R1":25*10**(-6), "H2O":225*10**(-6)}, 
                     {"sample":9*10**(-6), "R1":130*10**(-6), "R2":55*10**(-6)}, 
                     {"sample":4*10**(-6), "R1":210*10**(-6), "R2":90*10**(-6)}, 
                     {"sample":50*10**(-6), "R1":50*10**(-6)}, 
                     {"sample":100*10**(-6), "R1":50*10**(-6), "R2":50*10**(-6)}, 
                     {"sample":3*10**(-6), "R1":150*10**(-6), "R2":75*10**(-6), "H2O":10*10**(-6)}]

    # choose input for fixed required volume, and quantify volume in [mL]
        # back calculate channel volume in [mL and um^3]


    # perform for all urinalysis assays 
    for i in range(len(assay_ls)):
        assay = assay_ls[i]
        num_samples = num_samples_ls[i]
        input_dict = input_dict_ls[i]

        # calculate normalized channel lengths
        ratio_dict, length_dict = conc_ratio(input_dict)
        print(assay.upper())
        print("Length dict: ", length_dict, f"\n")
        
        # determine cross section dimensions [px, um] -> cross sectional area [um^2], hydraulic radius [um]

        # calculate fixed volume channel length [um]

        # calculate remaining channel lengths based on fixed channel volume [um]

        # calculate all hydraulic resistance values [Pa*s/um^3]

        # calculate all flow rates [mL/s]

        # calculate reamining channel and required volumes [mL]
            # utilize volume function in design_automation.py <-- rewrite to no longer have fixed cross section dimensions
        
        # define components/Verilog file 
   
    # function to assign varying cross section heights based on magnitudes of normalized resistances [px]

        # calculate actual width for "square" cross section [px]

        # return cross section height and width [um]

    # function to calculate cross sectional area [um^2]
        # return cross sectional area

    # function to calculate hydraulic resistance [um]
        # return hydraulic resistance 

    # function to calculate channel length from fixed volume amount, and remaining channel lengths based on proportions [um]

    # function to calculate hydraulic resistance [Pa*s/um^3]

    # function to calculate flow rate [mL/s]
        