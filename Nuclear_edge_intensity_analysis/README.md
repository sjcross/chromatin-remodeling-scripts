# Nuclear edge intensity analysis
"Nuclear edge intensity analysis.mia" is a workflow file for the [MIA (ModularImageAnalysis)](https://mianalysis.github.io) analysis automation plugin for ImageJ/Fiji.  This workflow file was designed using MIA version 1.2.0 (released 9th November 2022).  To ensure results are consistent, it is best to configure a copy of Fiji using plugins that were available when MIA v1.2.0 was released.

Note: Please do not run the ImageJ updater, as this will overwrite many of these files with newer versions and cause the workflow to run unreliably.

## Installation
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


## Running
1. Launch the downloaded copy of Fiji
2. Start MIA by going to Plugins > ModularImageAnalysis (MIA) > MIA
3. In the MIA control panel that opens, click "Load" and select the "Nuclear edge intensity analysis" file.  A set of parameters will be displayed; these are detailed below in "Parameters"
4. Click "Run" to start processing.  A progress bar will be shown along the bottom of the MIA control panel along with information about the current processing run.
      - Note: When processing multiple files in a folder, this will display the number of jobs running.  Click the progress text to toggle "verbose" mode.
5. When finished, the status bar will show "Complete!".  Results will be saved to an Excel file in the same folder as the input image (for single files) or in the selected folder when a folder is selected.
   
## Parameters
Some modules are optional; these are identified by green or black power icons.  Clicking the power icon will toggle its state.  Modules with a grey power icon are non-optional.  Parameters will be shown/hidden in response to the state of other parameters and modules.  As such, not all those listed below may be shown.  Parameter sections can be shown/hidden by clicking on the blue separator bars.

### File selection
   - _Input control > Input path_: Click this button to select either a file or folder to process.
   - _Input control > Extension_: If a folder is selected in "Input path", only those files matching this extension will be processed.
   - _Image loading > Slices_: Controls which Z-stack slices will be processed.  Values can be specified as comma-separated lists of integers or as hyphenated ranges.  The "end" keyword can be used to load all available slices without knowing the exact number in advance.

### Channel selection
   - _Nuclei channel > Channel number_: The channel index corresponding to the nuclear signal.  Numbering starts at "1".  This channel is required.
   - _Red channel > Channel number_: The channel index corresponding to the red signal.  Numbering starts at "1".  This channel is optional and can be disabled using the associated power icon.
   - _Green channel > Channel number_: The channel index corresponding to the green signal.  Numbering starts at "1".  This channel is optional and can be disabled using the associated power icon.
   
### Segmenting nuclei
   - _Z-axis mode > Z mode_: Controls whether nuclei are segmented in full 3D or as separate 2D planes.

### Measuring nuclei
   - _Edge intensity measurement > Edge width (um)_: Controls the width of the region at the surface of each nucleus from which the "edge" intensity measurements are taken.
   - _Measure edge intensity (red)_: This measurement can be enabled/disabled with the power icon.
   - _Measure edge intensity (green)_: This measurement can be enabled/disabled with the power icon.

### Object filtering
   - _Minimum whole red intensity_: When enabled (with the power icon), this allows a minimum whole nucleus red channel intensity to be specified.
   
### Visualisation
   - _Show image_: When enabled, the final outline image will be displayed as soon as it has been created.
   - _Save image_: When enabled, the final outline image will be saved to the same folder as the input image with the suffix "_outlines".  This image needs to be opened in ImageJ/Fiji for the outlines to be visible.
