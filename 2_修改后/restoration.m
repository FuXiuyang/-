function O = restoration(I, M)
% 图片修复，需要两个参数，第一个参数是破损文件名，第二个是
% 手工标记文件名。
% 例如：restoration('3ch_original.png', '3ch_mask.png')

% Load 3x3 model (change to "foe_5_24" for 5x5 model);
p = foe_3_8();

% 3 children B/W image
fprintf('Restoration of a photograph:\n\n');
I = double(I);
M = double(M);

% Scale down image and mask for faster results (comment out for
% original images)
I = imresize(I, 0.5);
M = imresize(M, 0.5);

% Perform 2500 iterations of inpainting
O = inpaint_foe(I, M > 0, p, 2000);

% Show results
% figure(1);  
% subplot(1, 3, 1)
% imagesc(I); colormap gray(256); axis image; axis off;
% title('Original image');
% subplot(1, 3, 2)
% imagesc(M); colormap gray(256); axis image; axis off;
% title('Inpainting mask');
% subplot(1, 3, 3)
% imagesc(O); colormap gray(256); axis image; axis off;
% title('Inpainted image');