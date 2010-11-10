%% getcorners: no function description!
function corners = getcorners(bw, threshold)

round_objects = getroundobjects(bw, threshold);
round_objects = round_objects';

round_objects(:, 3) = sqrt(round_objects(:, 3) / pi);

[a,index] = sort(round_objects(:,3), 1, 'descend');
corners = round_objects(index(1:4), :);

corners = corners(:,(1:2))';

new_corners = zeros(2, 4);
% top
[v, index] = min(corners(2, :));
new_corners(:, 1) = corners(:, index);
% right
[v, index] = max(corners(1, :));
new_corners(:, 2) = corners(:, index);
% bottom
[v, index] = max(corners(2, :));
new_corners(:, 3) = corners(:, index);
% left
[v, index] = min(corners(1, :));
new_corners(:, 4) = corners(:, index);

corners = new_corners';