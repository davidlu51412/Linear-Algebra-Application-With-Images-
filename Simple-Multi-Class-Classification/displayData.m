function [h, display_arr] = displayData(X, numIters)

% This is for .01 img resize
origRow = 31;
origCol = 24;

% This is for .03 img resize
% origRow = 93;
% origCol = 70;

% This is for .05 img resize
% origRow = 155;
% origCol = 116;

padding = 1;
paddingVert = 2;
paddingHoriz = numIters + 1;

display_arr = - ones(paddingVert + origRow, paddingHoriz + origCol * numIters);

% to account for padding
currCol = 2;
currRow = 2;
%we are putting it in one row, so we dont have to really change currRow;
for i = 1:numIters;
    temp = decompressIMG(X(i, :));
	rowBorder = origRow + 1;
	colBorder = currCol + origCol - 1;
	display_arr(currRow:rowBorder, currCol:colBorder) = temp;
	currCol = currCol + origCol + 1;
end

figure;
h = imagesc(display_arr);
colormap(gray);

% Do not show axis
axis image off

end
