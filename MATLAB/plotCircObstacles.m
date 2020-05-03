function plotCircObstacles(obstacles)
%plotObstacles Plot obstacles (rectangles).

N = size(obstacles.pos, 1);

for i = 1:N
    r = obstacles.radius(i, :);
    x = obstacles.pos(i, 1);
    y = obstacles.pos(i, 2);
    
    d = r*2;
    px = x-r;
    py = y-r;
    
    rectangle('Position', [px, py, d, d], 'Curvature', [1,1], 'FaceColor', [0 .5 .5], 'EdgeColor', 'k');
end

end

