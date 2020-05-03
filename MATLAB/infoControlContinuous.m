function phaseout = infoControlContinuous(input)

auxdata = input.auxdata;

rect = [auxdata.obstacle.pos, auxdata.obstacle.dim];

t       = input.phase.time(:, 1);

x       = input.phase.state(:, 1);
y       = input.phase.state(:, 2);
xdot    = input.phase.state(:, 3);
ydot    = input.phase.state(:, 4);

ux    = input.phase.control(:,1);
uy    = input.phase.control(:,2);

xddot = ux;
yddot = uy;

phaseout.dynamics  = [xdot, ydot, xddot, yddot];
phaseout.path      = [-rect_coll(rect, [x, y])];
phaseout.integrand = t + ux.^2 + uy.^2;

end