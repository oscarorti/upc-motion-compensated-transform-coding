function [ compensated_image_blocks, compensated_block_positions, mse_block_matrix ] = generate_compensated_image( frame1, frame2 )
% GENERATE_COMPENSATED_IMAGE
% Generates the compensated image and returns the image_blocks,
% block_positions and mse_block matrices.

splitted_frame1 = divide_image_in_blocks( frame1, 120, 120 );
splitted_frame2 = divide_image_in_blocks( frame2, 120, 120 );

[height, width] = size(splitted_frame2);

% Initialize variables
compensated_image_blocks = cell(height, width);
compensated_block_positions = cell(height, width);
mse_block_matrix = ones(height, width);

% Generate image_blocks, block_positions and MSE_block matrix
for i=1:height
    for j=1:width
        [compensated_image_blocks{i,j}, compensated_block_positions{i,j}, mse_block_matrix(i,j)] = search_most_similar_block( splitted_frame2{i,j}, splitted_frame1 );
    end
end

end
