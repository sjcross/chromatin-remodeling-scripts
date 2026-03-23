# "Tomography analysis"
"Tomography analysis.mia" is a MIA workflow file designed using MIA version 1.7.9 (released 11th April 2025).  As with "2022-12-14 Nuclear edge intensity_stardist(1).mia", it is best to use a copy of Fiji configured to match those around the time of release.

Note: Please do not run the ImageJ updater, as this will overwrite many of these files with newer versions and cause the workflow to run unreliably.

## Installation
1. Download the relevant copy of Fiji (version 20250408-1717) from [here](https://downloads.imagej.net/fiji/archive/20250408-1717/).
2. Extract the archive and put in a location with read/write access
3. Download the following files to the "plugins" folder of Fiji:
   - [MIA (v1.7.9)](https://github.com/mianalysis/mia/releases/download/v1.7.9/MIA_-1.7.9.jar)
   - [MorphoLibJ (v1.6.2)](https://github.com/ijpb/MorphoLibJ/releases/download/MorphoLibJ_-1.6.2/MorphoLibJ_-1.6.2.jar)
   - [MCIB3D Plugins (v4.1.7b)](https://sites.imagej.net/Tboudier/plugins/mcib3d-suite/mcib3d_plugins-4.1.7b.jar-20250205114700)
       - Note: It will be necessary to remove the numbers from the end of the filename
4. Download and extract the MIA dependency files to the "jars" folder of Fiji:
   - [MIA (v1.7.9) dependencies](https://github.com/mianalysis/mia/releases/download/v1.7.9/mia-dependencies-1.7.9.zip)
5. Download the following file to the "jars" folder of Fiji:
   - [MCIB3D Core (v4.1.7)](https://sites.imagej.net/Tboudier/plugins/mcib3d-suite/mcib3d-core-4.1.7.jar-20250122085707)
      - Note: It will be necessary to remove the numbers from the end of the filename

    
## Running
1. Launch the downloaded copy of Fiji
2. Start MIA by going to Plugins > ModularImageAnalysis (MIA) > MIA
3. In the MIA control panel that opens, click "Load" and select the "2025-05-20 Tomography analysis.mia" file.  A set of parameters will be displayed; these can be set as follows:
   - Note: Parameters will be shown/hidden in response to the state of other parameters.  As such, not all those listed below may be shown.
   - "File selection" section:
      - "Input control > Input path" - Click this button to select either a file or folder to process.
      - "Input control > Extension" - If a folder is selected in "Input path", only those files matching this extension will be processed.
      - "Input control > Image type" - Can be set to the following:
         - "Raw" - The input image will be in greyscale format.  As such, MIA will pass it through the image binarisation steps.
         - "Binary" - Chromatin has already been segmented in the image.  MIA will skip straight to the morphological analysis steps.
         - "Density" - The input image shows the density map.  MIA will only run the contour map generation steps.
   - "Cropping > Left|Top|Width|Height" - When "Cropping" is enabled, the crop coordinates can be specified in pixel units.
   - "Custom spatial calibration > Distance per pixel (XY)|Distance per pixel (Z)" - When "Custom spatial calibration" is enabled, the calibration of the loaded image will be overridden with the specified values.
   - "Pre-processing" section:
      - "Pre-processing > Pre-processing method" - Can be set to the following:
         - "EM (CLAHE)" -  CLAHE-based image binarisation steps will be used.  This is intended for EM images.
         - "EM (WEKA)" - Image binaration uses a WEKA pixel classifier to identify the chromatin.
         - "Fluorescence" - An intensity thresholding-based approach to image binarisation.
      - "Pre-processing > Classifier file path" - When using WEKA-based image binarisation, it is necessary to specify the WEKA classifier (.model) file.  The only requirement is that the chromatin is classified in channel 2.
      - "Pre-processing > Save binary image" - When enabled, the binarised image will be saved to the same folder as the input file, with the "_Binary" suffix.
   - "Morphometrics" section:
      - "Measure skeleton > Export longest path" - Exports the "longest shortest path", that is, the shortest path between all pairs of points in the skeleton is determined and the longest of all these shortest paths identified.
      - "Measure skeleton > Min. branch length (µm)" - The minimum branch length to be included in the skeleton.
      - "Measure skeleton > Measure object curvature" - When enabled, the curvature of the skeleton is measured.
      - "Measure skeleton > Save skeleton image" - When enabled, a binarised form of the skeleton is saved to the same folder as the input file, with the "_Skeleton" suffix.
      - "Measure skeleton > Add intensity to CSV > Raw image path" - If reporting image intensity along the skeleton path, it is necessary to re-load the raw intensity image.  This must be explicitly stated, in case the input image for the workflow was already binarised.
      - "Measure skeleton > Save coordinates to CSV" - When enabled, the coordinates (and optionally, intensity) are stored in a CSV file in the same folder as the input file, with the suffix "_ChromatinCoordinates.csv"


Results will be saved to an Excel file in the same folder as the input image (for single files) or in the selected folder when a folder is selected.
