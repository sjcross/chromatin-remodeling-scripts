[Documentation is a work in progress]
# Chromatin-remodeling scripts
Scripts used in the publication "Lamin A/C directs nucleosome-scale chromatin remodeling to define early lineage segregation in mammals"

## "2022-12-14 Nuclear edge intensity_stardist(1).mia"
"2022-12-14 Nuclear edge intensity_stardist(1).mia" is a workflow file for the [MIA (ModularImageAnalysis)](https://mianalysis.github.io) analysis automation plugin for ImageJ/Fiji.  This workflow file was designed using MIA version 1.2.0 (released 9th November 2022).  To ensure results are consistent, it is best to configure a copy of Fiji using plugins that were available when MIA v1.2.0 was released.

### Installation
1. Download the relevant copy of Fiji (version 20221103-1117) from [here](https://downloads.imagej.net/fiji/archive/20221103-1117/).
2. Extract the archive and put in a location with read/write access
3. Download the MIA (v1.2.0) plugin from [here](https://github.com/mianalysis/mia/releases/download/v1.2.0/MIA_-1.2.0.jar) and place this file in the "plugins" folder of Fiji.
4. Download the MorphoLibJ (v1.5.0) plugin from [here](https://github.com/ijpb/MorphoLibJ/releases/download/v1.5.0/MorphoLibJ_-1.5.0.jar) and place this file in the "plugins" folder of the Fiji.
5. [StarDist](https://sites.imagej.net/StarDist/plugins/StarDist_-0.3.0.jar-20200421142655)
6. [Clipper](https://sites.imagej.net/StarDist/jars/Clipper-6.4.2.jar-20200108164851)
7. [commons-text](https://sites.imagej.net/StarDist/jars/commons-text-1.6.jar-20200408120155)
8. [CSBDeep](https://sites.imagej.net/CSBDeep/jars/csbdeep-0.6.0.jar-20200808215936)
9. [libtensorflow](https://sites.imagej.net/CSBDeep/jars/libtensorflow-1.15.0.jar-20200625011259)
10. [libtensorflow-jni](https://sites.imagej.net/CSBDeep/jars/libtensorflow_jni-1.15.0.jar-20200625011259)
11. [proto](https://sites.imagej.net/CSBDeep/jars/proto-1.15.0.jar-20200808215936)
12. [tensorflow](https://sites.imagej.net/CSBDeep/jars/tensorflow-1.15.0.jar-20200625011259)

13. 

### Running
1. Launch the downloaded copy of Fiji
2. Start MIA by going to Plugins > ModularImageAnalysis (MIA) > MIA
3. In the MIA control panel that opens, click "Load" and select the "2022-12-14 Nuclear edge intensity_stardist(1).mia" file

## "2025-05-20 Tomography analysis.mia"
"2025-05-20 Tomography analysis.mia" is a MIA workflow file designed using MIA version 1.7.9 (released 11th April 2025).  As with "2022-12-14 Nuclear edge intensity_stardist(1).mia", it is best to use a copy of Fiji configured to match those around the time of release.

## "2025-06-10 Density histogram.groovy"
"2025-06-10 Density histogram.groovy" is a standalone Groovy script which can be run directly in Fiji from the script editor

## "Heterochromatin_Analysis.ijm"
"Heterochromatin_Analysis.ijm" is an ImageJ macro which can be run directly in Fiji from the script editor
