function output = circ_coll(circ, point)
%rect_coll Determine circle collision distance
%   circ should be a 3D vector [x, y, r]

dx = point(:, 1) - circ(1);
dy = point(:, 2) - circ(2);

output = sqrt(dx.^2 + dy.^2) - circ(3);
end

