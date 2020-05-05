function GDOP = gdop1(x,y, SVs)
%gdop1 is a measure of precision. References:
%http://www.colorado.edu/geography/gcraft/notes/gps/gps.html
%http://www.colorado.edu/geography/gcraft/notes/gps/gif/gdop.gif
pos = [x,y];    %a given x-y coord
%ranges for receiver position estimate
Ri = sqrt((SVs(:,1)-pos(1,1)).^2 + (SVs(:,2)-pos(1,2)).^2);
Dx = (SVs(:,1)-pos(1))./Ri; % directional derivative
Dy = (SVs(:,2)-pos(2))./Ri; % directional derivative
A = horzcat(Dx, Dy); %[Dx0, Dy0; Dx1, Dy1]
P = inv(A'*A);
GDOP = sqrt(trace(P));
end