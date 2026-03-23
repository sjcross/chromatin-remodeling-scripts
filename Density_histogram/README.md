# Density histogram
"Density histogram.groovy" is a Groovy script to create a histogram specifically for the nuclear regions of a density map image.  As inputs, it requires both a density map image and a corresponding binary mask showing the nucleus.

## Installation
This uses ImageJ2 scripting parameters, so is most easily run in [Fiji](https://fiji.sc).  Beyond this, there are no additional requirements and as such, it should run as expected in the latest version of Fiji.

## Running
1. Launch any copy of Fiji
2. Open a density map image and binarised image of a nucleus in Fiji
3. Drag the "Density histogram.groovy" file into the Fiji window, which should load the script into the script editor
4. Click "Run" and select the density and mask images in the dialog box that appears, as well as the number of bins for the histogram, then click "OK"
5. Click "Yes" when asked about processing all slices
