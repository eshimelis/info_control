function output = circCollisions(obstacles, pos)
%obstacleCollisions Determine if any portion of the path interesects with
% obstacles.

N = size(obstacles.pos, 1);
M = size(pos, 2)/4;

output = zeros(size(pos, 1), N*M);

k = 1;
for i = 1:M
    for j = 1:N
        output(:, k) = circ_coll([obstacles.pos(j, :), obstacles.radius(j, :)], pos(:, (4*(i-1))+(1:2)));
        k = k + 1;
    end
end

end

