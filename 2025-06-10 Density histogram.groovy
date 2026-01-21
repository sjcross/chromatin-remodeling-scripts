//@ ImagePlus (label="Density image") density
//@ ImagePlus (label="Mask image") mask
//@ Integer (label="Number of bins", value=256) nBins

// Imports
import fiji.stacks.Hyperstack_rearranger
import ij.IJ
import ij.measure.ResultsTable
import ij.plugin.HyperStackConverter
import ij.plugin.ImageCalculator

// Esuring both inputs are Z-stacks
forceZStack(density)
forceZStack(mask)

// Duplicating so we don't affect the input images
mask = mask.duplicate()
density = density.duplicate()	

// Dilating image to emsure no edge effects on boundaries to background
inv = mask.duplicate()
IJ.run(inv,"Invert","");
IJ.run(inv,"Options...","iterations=100 count=1 black do=Dilate stack");
ImageCalculator.run(mask, inv, "Subtract stack");

// Iterating over each pixel in the mask, checking if it's foreground and if so, 
// adding to the histogram
hist = new int[nBins];

total = mask.getNChannels()*mask.getNSlices()*mask.getNFrames();
count = 0;
for (c=0;c<mask.getNChannels();c++) {
	for (z=0;z<mask.getNSlices();z++) {	
		for (t=0;t<mask.getNFrames();t++) {	
			mask.setPosition(c+1,z+1,t+1);
			mIpr = mask.getProcessor()
			
			density.setPosition(c+1,z+1,t+1);
			dIpr = density.getProcessor()
			
			for (x=0;x<mask.getWidth();x++) {
				for (y=0;y<mask.getHeight();y++) {
					maskVal = mIpr.getValue(x,y);
					if (maskVal == 255) {
						densityVal = (int) Math.round(dIpr.getValue(x,y));
						
						// We haven't normalised the density map intensities, 
						// so the values should directly map to the 256 bins of the 
						// hist array
						hist[densityVal]++;
						
					}
				}
			}
			
			IJ.showProgress((double) (count++)/ (double) total);
			
		}
	}
}

// Creating and displaying the results table
rt = new ResultsTable(0);

for (i=0;i<nBins;i++) {
	rt.addValue("Bin",i);
	rt.addValue("Frequency",hist[i]);
	
	if (i != nBins-1)
		rt.addRow()
		
}

rt.show("Density histogram");

def forceZStack(input) {
	nChannels = input.getNChannels();
    nFrames = input.getNFrames();
    nSlices = input.getNSlices();

    if (nSlices == 1 && nFrames == 1)
        return;
        
    if (input.getNFrames() == 1 && input.getNSlices() > 1)
        return;
	        
    processed = HyperStackConverter.toHyperStack(input, nChannels, nFrames, nSlices);
    processed = Hyperstack_rearranger.reorderHyperstack(processed, "CTZ", true, false);
    input.setStack(processed.getStack());
	input.show()
	
}
