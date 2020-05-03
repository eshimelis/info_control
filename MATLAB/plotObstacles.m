function plotObstacles(obstacles)
%plotObstacles Plot obstacles (rectangles).

N = size(obstacles.pos, 1);

for i = 1:N
    rectangle('Position', [obstacles.pos(i, :), obstacles.dim(i, :)], 'FaceColor', [0 .5 .5], 'EdgeColor', 'k');
end

end

