[Documentation is a work in progress]
# Chromatin-remodeling scripts
Scripts used in the publication "Lamin A/C directs nucleosome-scale chromatin remodeling to define early lineage segregation in mammals"

## "2022-12-14 Nuclear edge intensity_stardist(1).mia"
"2022-12-14 Nuclear edge intensity_stardist(1).mia" is a workflow file for the [MIA (ModularImageAnalysis)](https://mianalysis.github.io) analysis automation plugin for ImageJ/Fiji.  This workflow file was designed using MIA version 1.2.0 (released 9th November 2022).  To ensure results are consistent, it is best to configure a copy of Fiji using plugins that were available when MIA v1.2.0 was released.

Note: Please do not run the ImageJ updater, as this will overwrite many of these files with newer versions and cause the workflow to run unreliably.

### Installation
1. Download the relevant copy of Fiji (version 20221103-1117) from [here](https://downloads.imagej.net/fiji/archive/20221103-1117/).
2. Extract the archive and put in a location with read/write access
3. Download the following files to the "plugins" folder of Fiji:
   - [MIA (v1.2.0)](https://github.com/mianalysis/mia/releases/download/v1.2.0/MIA_-1.2.0.jar)
   - [MorphoLibJ (v1.5.0)](https://github.com/ijpb/MorphoLibJ/releases/download/v1.5.0/MorphoLibJ_-1.5.0.jar)
   - [StarDist (v0.3.0)](https://maven.scijava.org/content/repositories/public/de/csbdresden/StarDist_/0.3.0-scijava/StarDist_-0.3.0-scijava.jar)
4. Download the following files to the "jars" folder of Fiji:
   - [Clipper (v6.4.2)](https://maven.scijava.org/content/repositories/public/de/lighti/Clipper/6.4.2/Clipper-6.4.2.jar)
   - [CSBDeep (v0.6.0)](https://maven.scijava.org/content/repositories/public/de/csbdresden/csbdeep/0.6.0/csbdeep-0.6.0.jar)
   - [ImageJ-Tensorflow (v1.1.6)](https://maven.scijava.org/content/repositories/public/net/imagej/imagej-tensorflow/1.1.6/imagej-tensorflow-1.1.6.jar)
   - [BioImageIO (v0.3.9)](https://maven.scijava.org/content/repositories/public/io/bioimage/java-bioimage-io/0.3.9/java-bioimage-io-0.3.9.jar)
   - [ImageJ-ModelZoo (v0.9.10)](https://maven.scijava.org/content/repositories/public/net/imagej/imagej-modelzoo/0.9.10/imagej-modelzoo-0.9.10.jar)
   - [LibTensorflow (v1.15.0)](https://repo1.maven.org/maven2/org/tensorflow/libtensorflow/1.15.0/libtensorflow-1.15.0.jar)
   - [LibTensorflow JNI (v1.15.0)](https://repo1.maven.org/maven2/org/tensorflow/libtensorflow_jni/1.15.0/libtensorflow_jni-1.15.0.jar)
   - [Proto (v1.15.0)](https://repo1.maven.org/maven2/org/tensorflow/proto/1.15.0/proto-1.15.0.jar)
   - [Tensorflow (v1.15.0)](https://repo1.maven.org/maven2/org/tensorflow/tensorflow/1.15.0/tensorflow-1.15.0.jar)


### Running
1. Launch the downloaded copy of Fiji
2. Start MIA by going to Plugins > ModularImageAnalysis (MIA) > MIA
3. In the MIA control panel that opens, click "Load" and select the "2022-12-14 Nuclear edge intensity_stardist(1).mia" file.  A set of parameters will be displayed; these can be set as follows:
   - "File selection" section:
      - "Input control > Input path" - Click this button to select either a file or folder to process.
      - "Input control > Extension" - If a folder is selected in "Input path", only those files matching this extension will be processed.
      - "Image loading > Slices" - Controls which Z-stack slices will be processed.  Values can be specified as comma-separated lists of integers or as hyphenated ranges.  The "end" keyword can be used to load all available slices without knowing the exact number in advance.
   - "Channel selection" section:
      - "Nuclei channel > Channel number" - The channel index corresponding to the nuclear signal.  Numbering starts at "1".  This channel is required.
      - "Red channel > Channel number" - The channel index corresponding to the red signal.  Numbering starts at "1".  This channel is optional and can be disabled using the associated power icon.
      - "Green channel > Channel number" - The channel index corresponding to the green signal.  Numbering starts at "1".  This channel is optional and can be disabled using the associated power icon.
   - "Segmenting nuclei" section:
      - "Z-axis mode > Z mode" - Controls whether nuclei are segmented in full 3D or as separate 2D planes.
   - "Measuring nuclei" section:
      - "Edge intensity measurement > Edge width (um)" - Controls the width of the region at the surface of each nucleus from which the "edge" intensity measurements are taken.
      - "Measure edge intensity (red)" - This measurement can be enabled/disabled with the power icon.
      - "Measure edge intensity (green)" - This measurement can be enabled/disabled with the power icon.
   - "Object filtering" section:
      - "Minimum whole red intensity" - When enabled (with the power icon), this allows a minimum whole nucleus red channel intensity to be specified.
   - "Visualisation" section:
      - "Show image" - When enabled, the final outline image will be displayed as soon as it has been created.
      - "Save image" - When enabled, the final outline image will be saved to the same folder as the input image with the suffix "_outlines".  This image needs to be opened in ImageJ/Fiji for the outlines to be visible.
    
Results will be saved to an Excel file in the same folder as the input image (for single files) or in the selected folder when a folder is selected.

## "2025-05-20 Tomography analysis.mia"
"2025-05-20 Tomography analysis.mia" is a MIA workflow file designed using MIA version 1.7.9 (released 11th April 2025).  As with "2022-12-14 Nuclear edge intensity_stardist(1).mia", it is best to use a copy of Fiji configured to match those around the time of release.

## "2025-06-10 Density histogram.groovy"
"2025-06-10 Density histogram.groovy" is a standalone Groovy script which can be run directly in Fiji from the script editor

## "Heterochromatin_Analysis.ijm"
"Heterochromatin_Analysis.ijm" is an ImageJ macro which can be run directly in Fiji from the script editor
