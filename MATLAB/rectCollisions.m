function output = rectCollisions(obstacles, pos)
%obstacleCollisions Determine if any portion of the path interesects with
% obstacles.

N = size(obstacles.pos, 1);

output = rect_coll([obstacles.pos(1, :), obstacles.dim(1, :)], pos);

for i = 2:N
    output = min(output, rect_coll([obstacles.pos(i, :), obstacles.dim(i, :)], pos));
end

end

