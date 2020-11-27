function score = IOUAlgorithm(labX, labY, labH, labV, propX, propY, propH, propV, templateImage)
% IOUAlgorithm  Computes the IOU score for a proposed bounding box (X, Y
% coord, Horizontal Scale, Vertical Scale), based on a labeled bounding box
% (X, Y coord, Horizontal Scale, Vertical Scale).
% 
% IOUAlgorithm(lXC, lYC, lHS, lVS, pXC, pYC, pHS, PVS) 
% Returns the score based on the IOU algorithm.
% 
% %%%%%%%%% Input Parameters %%%%%%%%%
% lXC: labeled X coordinate
% lYC: labeled Y coordinate
% lHS: labeled H scale factor
% lVS: labeled V scale factor
% pXC: proposed X coordinate
% pYC: proposed Y coordinate
% pHS: proposed H scale factor
% pVS: proposed V scale factor
% %%%%%%%%% Output parameters %%%%%%%%%
% score: Value between 1 and 0, indicating how well the proposed bounding
%        box matches the labeled bounding box
% 
% %%%%%%%%% Algorithm Explanation %%%%%%%%%
% The IOU algorithm works on the principle that how similar two bounding
% boxes are is equal to the Intersection of the two bounding box areas
% over the union of the two bounding box areas. 
% This can be thought of as area that is covered by both bounding boxes
% over the total area covered by both boxes (accounting for intersecting
% area only once)



    %% Getting dimensions
    [dim1, dim2] = size(templateImage);
    
    % Computing dimensions of labelled image
    labWidth = dim1 * labH;
    labHeight = dim2 * labV;
    
    % Computing dimensions of proposed image
    propWidth = dim1 * propH;
    propHeight = dim2 * propV;
    
    
    %% Compute intersection and union areas of the two rectangles
    
    % Formatting the rectangle dimensions to be what rectint accepts
    % i.e. (x, y, w, h)
    labRectDims = [labX, labY, labWidth, labHeight];
    propRectDims = [propX, propY, propWidth, propHeight];
    
    labArea = labWidth * labHeight;
    propArea = propWidth * propHeight;
    
    intArea = rectint(labRectDims, propRectDims);
    
    % Union area is the sum of areas minus the area that they intersect
    unArea = labArea + propArea - intArea;
    
    score = intArea / unArea;
end



