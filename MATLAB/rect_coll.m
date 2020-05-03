function output = rect_coll(rect, point)
%rect_coll Determine the distance between a rectangle and point, 0 if on or
% inside the rectangle
%   rect should be a 4D vector [x, y, w, h], where [x, y] defines the botto
%   left corner of the rectangle

rx = rect(1); ry = rect(2);
rw = rect(3); rh = rect(4);

px = point(:, 1); py = point(:, 2);

dx = max(min(px, rx + rw), rx);
dy = max(min(py, ry + rh), ry);

output = sqrt((px - dx).^2 + (py - dy).^2);
end

