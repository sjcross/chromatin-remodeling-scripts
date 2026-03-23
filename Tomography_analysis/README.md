# Tomography analysis
"Tomography analysis.mia" is a MIA workflow file designed using MIA version 1.7.9 (released 11th April 2025).  As with the [Nuclear edge intensity analysis](../Nuclear_edge_intensity_analysis) workflow, it is best to use a copy of Fiji configured to match those around the time of release.

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
3. In the MIA control panel that opens, click "Load" and select the "2025-05-20 Tomography analysis.mia" file.  A set of parameters will be displayed; these are detailed below in "Parameters"
4. Click "Run" to start processing.  A progress bar will be shown along the bottom of the MIA control panel along with information about the current processing run.
      - Note: When processing multiple files in a folder, this will display the number of jobs running.  Click the progress text to toggle "verbose" mode.
5. When finished, the status bar will show "Complete!".  Results will be saved to an Excel file in the same folder as the input image (for single files) or in the selected folder when a folder is selected.

## Parameters
Some modules are optional; these are identified by green or black power icons.  Clicking the power icon will toggle its state.  Modules with a grey power icon are non-optional.  Parameters will be shown/hidden in response to the state of other parameters and modules.  As such, not all those listed below may be shown.  Parameter sections can be shown/hidden by clicking on the blue separator bars.

### File selection
   - _Input control > Input path_: Click this button to select either a file or folder to process.
   - _Input control > Extension_: If a folder is selected in "Input path", only those files matching this extension will be processed.
   - _Input control > Image type_: Can be set to the following:
      - _Raw_: The input image will be in greyscale format.  As such, MIA will pass it through the image binarisation steps.
      - _Binary_: Chromatin has already been segmented in the image.  MIA will skip straight to the morphological analysis steps.
      - _Density_: The input image shows the density map.  MIA will only run the contour map generation steps.
   - _Cropping > Left|Top|Width|Height_: When "Cropping" is enabled, the crop coordinates can be specified in pixel units.
   - _Custom spatial calibration > Distance per pixel (XY)|Distance per pixel (Z)_: When "Custom spatial calibration" is enabled, the calibration of the loaded image will be overridden with the specified values.
     
### Pre-processing
- _Pre-processing > Pre-processing method_: Can be set to the following:
   - _EM (CLAHE)_:  CLAHE-based image binarisation steps will be used.  This is intended for EM images.
   - _EM (WEKA)_: Image binaration uses a WEKA pixel classifier to identify the chromatin.
   - _Fluorescence_: An intensity thresholding-based approach to image binarisation.
- _Pre-processing > Classifier file path_: When using WEKA-based image binarisation, it is necessary to specify the WEKA classifier (.model) file.  The only requirement is that the chromatin is classified in channel 2.
- _Pre-processing > Save binary image_: When enabled, the binarised image will be saved to the same folder as the input file, with the "_Binary" suffix.        

### Morphometrics
   - _Measure skeleton > Export longest path_: Exports the "longest shortest path", that is, the shortest path between all pairs of points in the skeleton is determined and the longest of all these shortest paths identified.
   - _Measure skeleton > Min. branch length (µm)_: The minimum branch length to be included in the skeleton.
   - _Measure skeleton > Measure object curvature_: When enabled, the curvature of the skeleton is measured.
   - _Measure skeleton > Save skeleton image_: When enabled, a binarised form of the skeleton is saved to the same folder as the input file, with the "_Skeleton" suffix.
   - _Measure skeleton > Add intensity to CSV > Raw image path_: If reporting image intensity along the skeleton path, it is necessary to re-load the raw intensity image.  This must be explicitly stated, in case the input image for the workflow was already binarised.
   - _Measure skeleton > Save coordinates to CSV_: When enabled, the coordinates (and optionally, intensity) are stored in a CSV file in the same folder as the input file, with the suffix "_ChromatinCoordinates.csv"

### Intensity profiles
   - _Intensity profile pre-filter > Radius (µm)_: Controls the size of the 3D mean filter applied to the binary image prior to intensity profile extraction.
   - _Save individual intensity profiles_: When enabled, an Excel (.xlsx) file containing the intensity profiles along the skeleton will be saved to the same folder as the input file, with the "_IndividualProfiles" suffix.

### Density calculation
   - _Density calculation > Scaling ("1" for none)_: To increase speed of calculation and reduce memory (RAM) requirements, the image can be downsampled by this factor.  A value of "1" will keep the full resolution.
   - _Density calculation > Sphere radius (µm)_: Radius of the sphere used to calulate the local density.  A larger radius will result in smoother, but less detailed, density map.
   - _Density calculation > Save density image_: When enabled, the density image will be saved to the same folder as the input file, with the "_Density" suffix.     

### Nucleosome measurements
   - _Load image > Nucleosome file path_: If making measurements using pre-detected nucleosomes, this path points to a binarised image showing the nucleosomes.
   - _Measure bands > Band width (µm)_: Concentric bands of this width will be created around each loaded nucleosome to allow for chromatin as a function of distance from nucleosomes to be measured.
   - _Measure bands > Max. distance (µm)_: The maximum distance from the nucleosomes that any band will be created.

### Gold particle measurements
   - _Load image > Gold particle file path_: If making measurements using pre-detected gold particles, this path points to a binarised image showing the gold particles.
   - _Measure bands > Band width (µm)_: Concentric bands of this width will be created around each loaded gold particle to allow for chromatin as a function of distance from gold particles to be measured.
   - _Measure bands > Max. distance (µm)_: The maximum distance from the gold particles that any band will be created.
     
## Third party library note
This workflow includes a modified version of the "Fast_filters3D" plugin from the ["MCIB3D Plugins"](https://framagit.org/mcib3d/mcib3d-plugins) suite to calculate the 3D mean filter.
