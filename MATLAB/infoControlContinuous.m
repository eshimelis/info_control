function phaseout = infoControlContinuous(input)

auxdata = input.auxdata;

t       = input.phase.time(:, 1);

x       = input.phase.state(:, 1);
y       = input.phase.state(:, 2);
xdot    = input.phase.state(:, 3);
ydot    = input.phase.state(:, 4);

ux    = input.phase.control(:,1);
uy    = input.phase.control(:,2);

xddot = ux;
yddot = uy;

% collisions = rectCollisions(auxdata.obstacles, [x, y]);
collisions = circCollisions(auxdata.obstacles, [x, y]);


phaseout.dynamics  = [xdot, ydot, xddot, yddot];
phaseout.path      = [-collisions]; % collision constraints
% phaseout.integrand = t + ux.^2 + uy.^2;
phaseout.integrand = t + ux.^2 + uy.^2;

end