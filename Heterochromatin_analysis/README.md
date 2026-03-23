# Heterochromatin analysis
"Heterochromatin_analysis.ijm" is an ImageJ macro for measuring various characteristics of heterochromatin.  

## Installation
This macro uses functionality and plugins included in the standard copy of [Fiji](https://fiji.sc).  As such, it should work as expected in the latest version of Fiji.
    
## Running
1. Launch any copy of Fiji
2. (Optional) Crop the image
    - Note: This may speed up the automated segmentation run, but isn't a vital step.
    - Use the rectangle ROI tool (furthest left button on ImageJ/Fiji interface) to draw a rectangle around the nucleus.
    - Select image > Crop
    - Save the image with the suffix "_crop" before making any other changes - this way it is possible to go back to it if necessary.
3. Select the nucleus outline and clear the region outside the nucleus
    - The nuclear outline wants to be the first ROI in the ROI Manager list.  Therefore, if the ROI Manager window is already open from a previous sample select all ROIs (CTRL + A) and press "Delete"
    - Select the freehand tool (fourth from the left in ImageJ/Fiji) and draw round the nucleus
    - Select Edit > Selection > Add to Manager
    - Click Edit > Clear Outside (the outside should now go black)
4. Select the nucleolus outlines (skip this if there are no nucleolus)
    - Note: These regions will be added to the ROI Manager in slots 2 onwards
    - Select the freehand draw tool again and draw round the first nucleolus
    - In the already-open ROI Manager click "Add [t]".  A new ROI should be added to the list.
    - With the nucleolus still selected, go to Process > Math > Add and enter 65535.
    - Repeat for all nucleolus in the image
5. Save the ROIs
    - Highlight all ROIs in the ROI Manager (CTRL + A) and click More > Save.  Store them in the same place as the cropped image.
6. Segment the image
    - Click Plugins > Segmentation > Trainable Weka Segmentation
    - On the interface click "Create new class" and enter class3.  Repeat this for another 2 classes, so there are 5 in total.
    - On the image in the trainable segmentation interface draw round portions of the black background.  After each one click "Add to class 1" on the right side of the interface.
    - Repeat this for other regions in the image. 
      - Class 1 is the outside nucleus background (should be black)
      - Class 2 is the nucleolus (should be white)
      - Class 3 is the heterochromatin
      - Class 4 is the inside nucleus background
      - Class 5 (optional) are the dark spots of stain
      - Note: It is best to select at least 5 samples per class for the image, but the more it has, the better the segmentation will be.
    - Click "Train classifier" and wait.  This can take a few minutes depending on your PC.
    - Classification is complete once the image has the colours applied to it.
    - Save the classifier using the "Save classifier" button
    - Click "Create result" to show the classified image.  Save this as well.
7. Running the analysis
    - Close all windows apart from the ROI Manager and the classified image.
    - Drag the "Heterochromatin_analysis.ijm" file into Fiji; the script editor should open.
    - Click "Run" and the macro should begin running.  During this, loads of images will pop up and disappear.  A message pops up once the analysis is complete.
    - A summary of the results will be displayed in both the results table (easier to copy to Excel) and in the log window (easier to read).
 
## Measurements
The macro will produce the following measurements:
  - Total nucleus area in px²
  - Total nucleolus area in px²
  - Total heterochromatin area in px²
  - Total heterochromatin perimeter in px
  - Heterochromatin fractal index
  - Proportion of the total nuclear area that is heterochromatin
  - Proportion of the accessible nuclear area (nucleus area - nucleolus area) that is heterochromatin
  - The maximum distance from anywhere in the nucleus to the edge of the nucleus (this is used for normalisation of values later on)
  - The mean distance of all heterochromatin pixels to the edge of the nucleus.
  - Standard deviation of the above value
  - The mean distance of all heterochromatin pixels to the edge of the nucleus normalised to the maximum possible distance
  - Standard deviation of the above value
  - The maximum distance from anywhere in the nucleus to the edge of the accessible area
  - The mean distance of all heterochromatin pixels to the edge of the accessible area.
  - Standard deviation of the above value
  - The mean distance of all heterochromatin pixels to the edge of the accessible area normalised to the maximum possible distance
  - Standard deviation of the above value
  - Width of the edge for calculation of proportion of heterochromatin at nucleus edge (currently width corresponds to ~5% of nucleus radius)
  - Proportion of heterochromatin within the edge region of nucleus
  - Proportion of heterochromatin within the edge region of accessible area (edge includes region around nucleolus).
    
