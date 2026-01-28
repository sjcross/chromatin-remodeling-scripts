# Chromatin-remodeling scripts
Scripts used in the publication "Lamin A/C directs nucleosome-scale chromatin remodeling to define early lineage segregation in mammals"

## Usage
### "2022-12-14 Nuclear edge intensity_stardist(1).mia"
"2022-12-14 Nuclear edge intensity_stardist(1).mia" is a workflow file for the [MIA (ModularImageAnalysis)](https://mianalysis.github.io) analysis automation plugin for ImageJ/Fiji.  This workflow file was designed using MIA version 1.2.0 (released 9th November 2022).  To ensure results are consistent, it is best to configure a copy of Fiji using plugins that were available when MIA v1.2.0 was released.

#### Installation
1. Download the relevant copy of Fiji (version 20221103-1117) from [here](https://downloads.imagej.net/fiji/archive/20221103-1117/).
2. Extract the archive and put in a location with read/write access
3. Download the MIA v1.2.0 plugin from [here](https://github.com/mianalysis/mia/releases/download/v1.2.0/MIA_-1.2.0.jar) and place this file in the "plugins" folder of the newly-downloaded Fiji

#### Running
1. Launch the downloaded copy of Fiji
2. Start MIA by going to Plugins > ModularImageAnalysis (MIA) > MIA
3. In the MIA control panel that opens, click "Load" and select the "2022-12-14 Nuclear edge intensity_stardist(1).mia" file


- "2025-05-20 Tomography analysis.mia" is a MIA workflow file designed using MIA version 1.7.9
- "2025-06-10 Density histogram.groovy" is a standalone Groovy script which can be run directly in Fiji from the script editor
- "Heterochromatin_Analysis.ijm" is an ImageJ macro which can be run directly in Fiji from the script editor
