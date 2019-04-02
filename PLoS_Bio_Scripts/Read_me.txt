
READ ME

Scripts are organized into three sections:

Section 1: 
Processing and analyzing the real-life gecko photos.

Section 2:
Creating and storing the library of computer-simulated LALI patterns.

Section 3:
Analyzing the computer-simulated LALI patterns.


It is likely I have not included enough details to understand and follow what all the scripts are doing. Please don't hesitate to e-mail me at abyrne@southalabama.edu.



---------------------------------------------------------

Section 1: 
Processing and analyzing the real-life gecko images.

CropGeckoPictures: This folder contained the original and cropped real-life gecko photos. It also contains the files to cut the largest disk from the head region and binarize the pattern to a set of black and white pixels. There are 8 binary processed patterns, one for each of the eight geckos.

*CropGeckoPictures/FirstFigure_HeadCutToDisk_Jan28_2016: this is the script used to generate the first column of Figure 3

Figure3_4_GeckoDiskStatistics: This folder contains the scripts to compute the statistics (FA, EE, SS and PL). It needs to navigate back and forth from CropGeckoPictures so I don't change the name (or update the figure numbers to correspond with the paper..). 



---------------------------------------------------------

Section 2:
Creating and storing the library of computer-simulated LALI patterns.


GeckoMatFiles: This folder has the scripts to generate the LALI patterns.This folder contains thousands of stored LALI patterns. These are needed for Section 3.

*GeckoMatFiles/retrieve_genotype_Feb23.m: this script stores the parameters for the LALItype match that was chosen for each gecko, or creates the genotype corresponding to an arbitary fu

GeckoMatFiles/RxnDiff_specifyALL.m: this script is the code that simulates reaction *diffusion and generates the LALi pattern (it requires diffuse.m)

*GeckoMatFiles/generate_phenotypes_Feb23.m: 

1) this script generates a LALI pattern for whichever gecko you specify (there are 8 geckos with labels  681   682   732   735   772   773   731   763) based on a LALItype match that was chosen for that gecko

2) this script ALSO has the ability to generate LALI patterns for an arbitrary value of fu (instead of using the gecko label, you input "gecko", where gecko is an integer fu*1000)

fhn_computation_scripts:this zipped folder contains the scripts for the non-linear reaction diffusion model


---------------------------------------------------------

Section 3:
Analyzing the computer-simulated LALI patterns.


Figure_ReactionNorm: This folder has the scripts to generate the clouds, showing how hundreds of patterns with one LALItype distribute to a range of FA and EE values. It also includes the exact scripts we used to generate these figures in the paper. 

*Figure_ReactionNorm/make_figures_closest_patterns.m: 
this script generates Figure 3, Columns 4 and 5

*Figure_ReactionNorm/Figure_show_phenotype.m: 
this script generates Figure 7, Panels C and D


Figure4_LALIspace: This folder has the scripts to generate the LALIspace for each gecko. (That is, to find the neutral region of LALItypes that are likely to result in patterns that are similar to each of the eight geckos.) It also includes the exact scripts we used to generate these figures in the paper.

StudyPathThreshold and StudyTimeDevelopment: These folders were used to generate corresponding figures in the supplemental methods. 

ShowingLALI_Map_Bias: this folder includes duplicate scripts but also includes scripts to show the bias of the LALI map and contains the scripts to generate figure 9 of the manuscript

*ShowingLALI_Map_Bias/figure_grids_Jan06.m: this generates Figure 9 panels A and B
*ShowingLALI_Map_Bias/Figure_reaction_norms_edgesMay2018: this generates Figure 10 panel A
*ShowingLALI_Map_Bias/Figure_reaction_norms_edges_Tilmann_May2018: this generates Figure 10 panel B




-----------------------------------------------------------
For numbered folders, the figure numbers do not correspond to the figure numbering in the paper.

