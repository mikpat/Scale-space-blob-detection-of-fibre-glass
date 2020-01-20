# Scale-space blob detection of fibre glass

Objective: detect and measure diameters of glass fibres in images of glass fibre composite captured by X-ray CT-scanner, optical microscope and SEM.  

## Description

This project was done as a part of Advanced Image Analysis course at DTU. The data was provided by the lecturers. The aim is to find center coordinates and diameters of glass fibres. Since the fibres are relatively circular it is possible to model them as circles. The example image is shown below.

<p align="center">
  <img src="https://raw.githubusercontent.com/mikpat/Scale-space-blob-detection-on-X-ray-CT/master/Data/Optical.png" height="400" width="600">
</p>

## Approach

The Laplacian(second derivative of Gaussian) kernel can be convolved with an image in order to detect blobs. The center of the blob is located at the location of local minimal/maximal values of Laplacian response. Scale-space representation is used to measure the diameter of the blobs. The image is convolved with Gaussian kernels that have increasing variance. This produces 3D volumetric data with spatial image coordinates (x, y) and the scale in the third dimension. Finding local minima/maxima in the volumetric data allows to detect the scale of the blobs based on used variance of Gaussian kernel. This approach allows to compute circles' coordinates and diameters.

## Results

Below are shown source images with detected blobs as red circles.

Glass fibres obtained by optical microscopy:

<p align="center">
  <img src="https://raw.githubusercontent.com/mikpat/Scale-space-blob-detection-on-X-ray-CT/master/Output_imgs/Optical.png" height="400" width="600" >
</p>

Glass fibres obtained by SEM:

<p align="center">
  <img src="https://raw.githubusercontent.com/mikpat/Scale-space-blob-detection-on-X-ray-CT/master/Output_imgs/SEM.png" height="400" width="600" >
</p>

Glass fibres obtained by optical X-ray CT:

<p align="center">
  <img src="https://raw.githubusercontent.com/mikpat/Scale-space-blob-detection-on-X-ray-CT/master/Output_imgs/CT_synchrotron.png"  height="400" width="600">
</p>




