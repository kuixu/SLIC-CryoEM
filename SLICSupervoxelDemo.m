%SLIC supervoxels demo
% Copyright (C) 2015 Ecole Polytechnique Federale de Lausanne
% File created by Radhakrishna Achanta
% Please also read the copyright notice in the file slicsupervoxelmex.c 
%======================================================================
%Input parameters are:
%[1] 8 bit images (color or grayscale)
%[2] Number of required superpixels (optional, default is 200)
%[3] Compactness factor (optional, default is 10)
%
%Ouputs are:
%[1] labels (in raster scan order)
%[2] number of labels in the image (same as the number of returned
%superpixels
%
%NOTES:
%[1] The output numlabels gives number of superpixels generated
%[2] number of returned supervoxels may be different from the input
%number of supervoxels.
%[3] you must compile the C file using:
%
%     "mex slicsupervoxelmex.c"
%
%before using the Matlab code below.
%
% Example below shows how a stack may be prepared as input. It also
% shows how a desired supervoxel size may be used to obtain the
% required number of supervoxels.
%
% You may want to try different compactness value as per you needs.
%======================================================================
clear all;
colorstack = 0;%set to zero for a grayscale demo.
im = imread('bee.jpg');
%numreqiredsupervoxels = 0;
reqdsupervoxelsize = 100;
if 1 == colorstack
    stack = cat(4,im,im,im,im,im);
    dims = size(stack);
    numreqiredsupervoxels = dims(1)*dims(2)*dims(4)/reqdsupervoxelsize;
else
    im = rgb2gray(im);
    stack = cat(3,im,im,im,im,im);
    dims = size(stack);
    numreqiredsupervoxels = prod(dims)/reqdsupervoxelsize;
end
numreqiredsupervoxels=100;
compactness = 10.0;
[labels, numlabels] = slicsupervoxelmex(stack,numreqiredsupervoxels,compactness);
%imagesc(labels(:,:,1));
numlabels





%e3=cat(3,e,e,e);
%eimg=img;
%eimg(e3)=255;
%imshow(eimg)


labels=uint8(labels);
bw=edge(reshape(labels,size(labels,1),[]),'canny');
bw2=reshape(bw,size(labels));

estack=stack;
estack(bw2)=255;
implay(estack)