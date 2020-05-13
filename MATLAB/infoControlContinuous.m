function phaseout = infoControlContinuous(input)

auxdata = input.auxdata;
numAgents = auxdata.numAgents;
pos_idx = auxdata.pos_idx;
max_radius = auxdata.max_radius;

t = input.phase.time(:, 1);

phaseout.integrand = t;
phaseout.dynamics = [];
phaseout.path = [];

% state dynamics
phaseout.dynamics = input.phase.state*auxdata.A' + input.phase.control*auxdata.B';

% path constraints
phaseout.path = [-circCollisions(auxdata.obstacles, input.phase.state), maxSeparation(input.phase.state(:, pos_idx), max_radius)];

gdop = calcGPOPSGDOP(input.phase.state(:, pos_idx));

% integrand
phaseout.integrand = t + sqrt(sum(input.phase.control(:, 1:2).^2, 2)) + gdop;

end