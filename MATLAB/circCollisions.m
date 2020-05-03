function output = circCollisions(obstacles, pos)
%obstacleCollisions Determine if any portion of the path interesects with
% obstacles.

N = size(obstacles.pos, 1);

output = zeros(size(pos, 1), N);

for i = 1:N
    output(:, i) = circ_coll([obstacles.pos(i, :), obstacles.radius(i, :)], pos);
end

end

