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
3. In the MIA control panel that opens, click "Load" and select the "2022-12-14 Nuclear edge intensity_stardist(1).mia" file

## "2025-05-20 Tomography analysis.mia"
"2025-05-20 Tomography analysis.mia" is a MIA workflow file designed using MIA version 1.7.9 (released 11th April 2025).  As with "2022-12-14 Nuclear edge intensity_stardist(1).mia", it is best to use a copy of Fiji configured to match those around the time of release.

## "2025-06-10 Density histogram.groovy"
"2025-06-10 Density histogram.groovy" is a standalone Groovy script which can be run directly in Fiji from the script editor

## "Heterochromatin_Analysis.ijm"
"Heterochromatin_Analysis.ijm" is an ImageJ macro which can be run directly in Fiji from the script editor
