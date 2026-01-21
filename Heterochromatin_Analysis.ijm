targetInt = 190;
edgePC = 5; // Percentage of radius (assumes circle)

// ***** PREPARING IMAGES ***** //
run("Select None");
run("Set Scale...", "distance=0 known=0 pixel=1 unit=pixel");
classifiedImage = getTitle();
run("8-bit");

binaryMask  = getBinaryNucleus(classifiedImage,true);
hcMask = getHeterochromatinMask(classifiedImage,binaryMask);
selectWindow(binaryMask);
close();


// ***** MEASURING NUCLEAR AREA ***** //
nucleusArea = getNucleusArea(hcMask);
IJ.log("Nucleus area: "+nucleusArea+" px^2");


// ***** MEASURING TOTAL NUCLEOLUS AREA ***** //
nucleolusArea = getNucleolusArea(hcMask);
IJ.log("Nucleolus area: "+nucleolusArea+" px^2");


// ***** CALCULATING THE HETEROCHROMATIN AREA AND PERIMETER ***** //
heterochromatinArea = calculateHeterochromatinArea(hcMask);
IJ.log("Heterochromatin area: "+heterochromatinArea+" px^2");

heterochromatinPerimeter = calculateHeterochromatinPerimeter(hcMask);
IJ.log("Heterochromatin perimeter: "+heterochromatinPerimeter+" px");


// ***** CALCULATING THE FRACTAL DIMENSION INDEX (FRAC) ***** //
// Metric from (http://www.umass.edu/landeco/research/fragstats/documents/Metrics/Shape%20Metrics/Metrics/P9%20-%20FRAC.htm), accessed 08-02-2017
FRAC = calculateFRAC(heterochromatinArea, heterochromatinPerimeter);
IJ.log("Heterochromatin fractal dimension index: "+FRAC);


// ***** CALCULATING THE AREA PROPORTION ***** //
nuclearProportion = heterochromatinArea/nucleusArea;
accessibleProportion = heterochromatinArea/(nucleusArea-nucleolusArea);

IJ.log("Nuclear proportion: "+nuclearProportion);
IJ.log("Accessible proportion: "+accessibleProportion);


// ***** CALCULATING THE HC PROXIMITY TO THE NUCLEAR EDGE ***** //
binaryMask = getBinaryNucleus(classifiedImage,false);
run("Distance Map");
distanceMap = getTitle();
selectWindow(binaryMask);
close();

run("Clear Results");
selectWindow(distanceMap);
run("Measure");
maxNucDist = getResult("Max",0);
IJ.log("Maximum distance to nuclear perimeter: "+maxNucDist+" px");

results = calculateDistanceToEdge(distanceMap,hcMask);
selectWindow(distanceMap);
close();

nucMeanDistance = results[0];
nucStdDistance = results[1];
nucMeanDistanceNorm = nucMeanDistance/maxNucDist;
nucStdDistanceNorm = nucStdDistance/maxNucDist;
IJ.log("Mean distance from nuclear perimeter: "+nucMeanDistance+" px +/- "+nucStdDistance+" px");
IJ.log("Mean distance from nuclear perimeter (normalised): "+nucMeanDistanceNorm+" +/- "+nucStdDistanceNorm);


// ***** CALCULATING THE HC PROXIMITY TO THE ACCESSIBLE AREA EDGE ***** //
selectWindow(hcMask);
binaryMask = getBinaryNucleus(classifiedImage,true);
run("Distance Map");
distanceMap = getTitle();
selectWindow(binaryMask);
close();

run("Clear Results");
selectWindow(distanceMap);
run("Measure");
maxAccDist = getResult("Max",0);
IJ.log("Maximum distance to accessible are perimeter: "+maxAccDist+" px");

results = calculateDistanceToEdge(distanceMap,hcMask);
selectWindow(distanceMap);
close();

accMeanDistance = results[0];
accStdDistance = results[1];
accMeanDistanceNorm = accMeanDistance/maxAccDist;
accStdDistanceNorm = accStdDistance/maxAccDist;
IJ.log("Mean distance from accessible area perimeter: "+accMeanDistance+" px +/- "+accStdDistance+" px");
IJ.log("Mean distance from accessible area perimeter (normalised) : "+accMeanDistanceNorm+" +/- "+accStdDistanceNorm);

// ***** CALCULATING THE HC FRACTION WITHIN A SET DISTANCE OF THE NUCLEAR EDGE ***** //
edgeWidth = sqrt(nucleusArea/PI)*(edgePC/100);
IJ.log("Edge width: "+edgeWidth+" px");

selectWindow(hcMask);
binaryMask = getBinaryNucleus(classifiedImage,false);
edgeMask = getEdgeMask(binaryMask,hcMask,edgeWidth);

heterochromatinAreaNucEdge = calculateHeterochromatinArea(edgeMask);
IJ.log("Proportion of heterochromatin within "+edgeWidth+" px of nuclear perimeter: "+heterochromatinAreaNucEdge/heterochromatinArea);

selectWindow(binaryMask);
close();
selectWindow(edgeMask);
close();


// ***** CALCULATING THE HC FRACTION WITHIN A SET DISTANCE OF THE ACCESSIBLE AREA EDGE ***** //
selectWindow(hcMask);
binaryMask = getBinaryNucleus(classifiedImage,true);
edgeMask = getEdgeMask(binaryMask,hcMask,edgeWidth);

heterochromatinAreaAccEdge = calculateHeterochromatinArea(edgeMask);
IJ.log("Proportion of heterochromatin within "+edgeWidth+" px of accessible area perimeter: "+heterochromatinAreaAccEdge/heterochromatinArea);

selectWindow(binaryMask);
close();

// ***** PUTTING ALL RESULTS INTO A SINGLE RESULTS TABLE ***** //
selectWindow(classifiedImage);
close();

run("Clear Results");

setResult("NUCLEUS_AREA_PX2",0,nucleusArea);
setResult("NUCLEOLUS_AREA_PX2",0,nucleolusArea);
setResult("HC_AREA_PX2",0,heterochromatinArea);
setResult("HC_PERIMETER_PX",0,heterochromatinPerimeter);
setResult("FRAC",0,FRAC);
setResult("NUCLEAR_PROPORTION",0,nuclearProportion);
setResult("ACCESSIBLE_PROPORTION",0,accessibleProportion);
setResult("MAX_POSS_NUC_EDGE_DISTANCE",0,maxNucDist);
setResult("MEAN_NUC_EDGE_DISTANCE",0,nucMeanDistance);
setResult("STD_NUC_EDGE_DISTANCE",0,nucStdDistance);
setResult("NORM_MEAN_NUC_EDGE_DISTANCE",0,nucMeanDistanceNorm);
setResult("NORM_STD_NUC_EDGE_DISTANCE",0,nucStdDistanceNorm);
setResult("MAX_POSS_ACC_EDGE_DISTANCE",0,maxAccDist);
setResult("MEAN_ACC_EDGE_DISTANCE",0,accMeanDistance);
setResult("STD_ACC_EDGE_DISTANCE",0,accStdDistance);
setResult("NORM_MEAN_ACC_EDGE_DISTANCE",0,accMeanDistanceNorm);
setResult("NORM_STD_ACC_EDGE_DISTANCE",0,accStdDistanceNorm);
setResult("EDGE_WIDTH",0,edgeWidth);
setResult("PROP_HC_AT_NUC_EDGE",0,heterochromatinAreaNucEdge/heterochromatinArea);
setResult("PROP_HC_AT_ACC_EDGE",0,heterochromatinAreaAccEdge/heterochromatinArea);

showMessage("Complete!");


// ***** FUNCTIONS ***** //
function getBinaryNucleus(exampleImage,includeNucleolus) {
	selectWindow(exampleImage);
	run("Select None");
	run("Duplicate...", " ");
	forManip = getTitle();
	run("Select All");
	setBackgroundColor(0, 0, 0);
	run("Clear", "slice");

	roiManager("Select", 0);
	run("Make Inverse");
	run("Add...", "value=255");
	
	if (includeNucleolus) {
		nRois = roiManager("count");
		for (i=1;i<nRois;i++) {
			roiManager("Select", i);
			run("Add...", "value=255");	
		}
	}
	
	run("Select None");

	return getTitle();
	
}

function getHeterochromatinMask(classifiedImage, binaryMask) {
	selectWindow(binaryMask);
	run("Options...", "iterations=6 count=1 edm=16-bit do=Nothing");
	run("Erode");
	run("Invert");
	run("Divide...", "value=255");
	run("Select None");
	imageCalculator("Multiply create", classifiedImage,binaryMask);

	setThreshold(190, 190);
	run("Convert to Mask");
	hcMask = getTitle();

	return hcMask;
	
}

function getNucleusArea(measImage) {
	selectWindow(measImage);
	run("Clear Results");
	selectWindow(measImage);
	roiManager("Select", 0);
	run("Measure");
	nucleusArea = getResult("Area",0);
	
	run("Select None");

	return nucleusArea;
	
}

function getNucleolusArea(measImage) {
	selectWindow(measImage);
	run("Clear Results");
	
	nucleolusArea = 0;
	nRois = roiManager("count");
	
	for (i=1;i<nRois;i++) {
		roiManager("Select", i);
		run("Measure");
		nucleolusArea = nucleolusArea + getResult("Area",i-1);
	}
	
	run("Select None");

	return nucleolusArea;

}

function getEdgeMask(binaryMask,hcMask,edgeWidth) {
	selectWindow(binaryMask);
	run("Duplicate...", " ");
	tempImage = getTitle();
	
	run("Distance Map");
	distanceMap = getTitle();

	setThreshold(0, edgeWidth);
	setOption("BlackBackground", false);
	run("Convert to Mask");
	run("Divide...", "value=255.000");	
	imageCalculator("Multiply create", hcMask,distanceMap);

	edgeMask = getTitle();

	selectWindow(distanceMap);
	close();
	selectWindow(tempImage);
	close();

	return edgeMask;

}

function calculateHeterochromatinArea(measImage) {
	selectWindow(measImage);
	run("Clear Results");
	
	run("Set Measurements...", "area mean standard modal min perimeter median redirect=None decimal=3");
	run("Analyze Particles...", "  show=Nothing display exclude clear");
	
	heterochromatinArea = 0;
	
	nObjects = nResults();
	for (i=0;i<nObjects;i++) {
		heterochromatinArea = heterochromatinArea + getResult("Area",i);
		
	}
	
	run("Clear Results");

	return heterochromatinArea;

}

function calculateHeterochromatinPerimeter(measImage) {
	selectWindow(measImage);
	run("Clear Results");
	
	run("Set Measurements...", "area mean standard modal min perimeter median redirect=None decimal=3");
	run("Analyze Particles...", "  show=Nothing display exclude clear");
	
	heterochromatinPerimeter = 0;
	
	nObjects = nResults();
	for (i=0;i<nObjects;i++) {
		heterochromatinPerimeter = heterochromatinPerimeter + getResult("Perim.",i);
	}
	
	run("Clear Results");

	return heterochromatinPerimeter;

}

function calculateFRAC(area, perimeter) {
	FRAC = (2*log(0.25*perimeter))/(log(area));

	return FRAC;
	
}

function calculateDistanceToEdge(distanceMap,objectMask) {
	run("Clear Results");
	
	selectWindow(hcMask);
	getDimensions(width, height, channels, slices, frames);

	i=0;
	for (r=0;r<height;r++) {
		for (c=0;c<width;c++) {
			if (getPixel(r,c) == 255) {
			setResult("Row",i,r);
			setResult("Col",i,c);
			i++;
			}
		}
	}

	selectWindow(distanceMap);
	for (i=0;i<nResults();i++) {
		setResult("Distance",i,getPixel(getResult("Row",i),getResult("Col",i)));
	}
	
	run("Summarize");

	nucMeanDistance = getResult("Distance",nResults()-4);
	nucStdDistance = getResult("Distance",nResults()-3);
	
	results = newArray(nucMeanDistance,nucStdDistance);
	run("Clear Results");
	
	return results;
	
}