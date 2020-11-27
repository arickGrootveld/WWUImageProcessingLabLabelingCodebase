function displayTransparentMixedImage(templateImage, targetImage, xOffset, yOffset, hScale, vScale)
    
    if(class(templateImage) == "logical")
        templateImage = cast(templateImage * 255, 'uint8'); 
    end
    sizeMatchedTemplate = zeros(size(targetImage));
    
    % Rescaling the template to match the input params
    resizedDims = [floor(size(templateImage, 1) * vScale), floor(size(templateImage, 2) * hScale)];
    rescaledTemp = imresize(templateImage, resizedDims);
    
    
    % Calculating the x and y coordinates that the template image should fill
    yCoords = yOffset+1:(yOffset+size(rescaledTemp, 1)); 
    xCoords = xOffset+1:(xOffset+size(rescaledTemp, 2));
    
    sizeMatchedTemplate(yCoords, xCoords) = rescaledTemp;
    
    imshow(sizeMatchedTemplate);
    
    hold on;

    dataImg = imshow(targetImage, 'InitialMagnification', 'fit');


    % Setting the Alpha parameter to let through the template image where it
    % appears
    alphaData = ones(size(targetImage));

    alphaData(yCoords, xCoords) = 0.5;

    set(dataImg, 'AlphaData', alphaData);
end