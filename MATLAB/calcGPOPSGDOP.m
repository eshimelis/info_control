function gdop_output = calcGPOPSGDOP(pos)
%calcGDOP Calculate the 2D GDOP of a set of agent trajectoris
%   Note: Assumes the first position is the 'center' of the group

% extract positions
centralAgent = pos(:, 1:2);
remAgents = pos(:, 3:end);

traj_N = size(centralAgent, 1);
agents_N = size(remAgents, 2)/2;

gdop_output = zeros(traj_N, 1);

for i = 1:size(centralAgent,1)
    main_pos = centralAgent(i, :);
    rem_pos = reshape(remAgents(i, :), [2, agents_N])';
%     gdop_output(i) = calcGDOP(main_pos, rem_pos);
    gdop_output(i) = gdop1(main_pos(1), main_pos(2), rem_pos);
end

% display(gdop_output)

end

