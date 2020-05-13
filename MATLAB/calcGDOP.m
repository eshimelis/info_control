function output = calcGDOP(main_pos, rem_pos)
%calcGDOP Calculate the 2D GDOP of a set of agent trajectoris
%   Note: Assumes the first position is the 'center' of the group

agents_N = size(rem_pos, 1);

main_pos = repmat(main_pos, agents_N, 1);

disp = rem_pos - main_pos;

R = repmat(sqrt(sum(disp.*disp, 2)), 1, 2);

A = cat(2, disp./R, 1*ones(agents_N, 1));

Q = inv(A' * A);

output = sqrt(trace(Q));

end

