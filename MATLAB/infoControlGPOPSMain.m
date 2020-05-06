%-------------------------------------------------------%
% 16.32 - Principles of Optimal Control and Estimation  %
% Term Project                                          %
%-------------------------------------------------------%
% Information-Seeking Control of Multi-Agent Systems    %
%                                                       %
% Author: Eyassu Shimelis                               %
% Created: April/May 2020                               %
%-------------------------------------------------------%

% ------------------------------------------------------------- %
%               Set up auxiliary data for problem               %
% ------------------------------------------------------------- %
auxdata.obstacles	= obstacles;
auxdata.numAgents	= numAgents;
auxdata.numObstacles = size(obstacles.pos, 1);
auxdata.pos_idx = zeros(1, 2*numAgents);
auxdata.max_radius = 30;

k = 1;
for i = 1:numAgents
    auxdata.pos_idx(k) = 4*i - 3;
    auxdata.pos_idx(k+1) = 4*i - 2;
    k = k + 2;
end

auxdata.A = zeros(4*numAgents, 4*numAgents);
auxdata.B = zeros(4*numAgents, 2*numAgents);
A = [0, 0, 1, 0;
     0, 0, 0, 1;
     0, 0, 0, 0;
     0, 0, 0, 0];
B = [0, 0;
     0, 0;
     1, 0;
     0, 1];
 

% --------------------------------------------------------------%
%           Set up bounds on state, control, and time           %
% --------------------------------------------------------------%

initState = [start.pos, start.vel];
finalState = [goal.pos, goal.vel];
finalStateGuess = finalState;
auxdata.A(1:4, 1:4) = A;
auxdata.B(1:4, 1:2) = B;

posOffset = [2, 0];
velOffset = [0, 0];

% create escorting agents
for i = 1:numAgents-1
    initState = cat(2, initState, [posOffset*i, velOffset]);
    finalStateGuess = cat(2, finalStateGuess, [posOffset*i, velOffset]);
    auxdata.A(4*i+(1:4), 4*i+(1:4)) = A;
    auxdata.B(4*i+(1:4), 2*i+(1:2)) = B;
end

t0 = 0;
tfmin = 0; tfmax = 1e4;
vmin = -20; vmax = 20;
umin = -0.5*[1, 1] ; umax = 0.5*[1, 1];

% constrain states based on map bounds
stateMin = [min(map.bounds.x), min(map.bounds.y), vmin, vmin];
stateMax = [max(map.bounds.x), max(map.bounds.y), vmax, vmax];

finalStateLower = cat(2, finalState, repmat(stateMin, 1, numAgents-1));
finalStateUpper = cat(2, finalState, repmat(stateMax, 1, numAgents-1));

bounds.phase.initialtime.lower  = t0;
bounds.phase.initialtime.upper  = t0;
bounds.phase.finaltime.lower    = tfmin;
bounds.phase.finaltime.upper    = tfmax;

bounds.phase.initialstate.lower = initState;
bounds.phase.initialstate.upper = initState;

bounds.phase.state.lower        = repmat(stateMin, 1, numAgents);
bounds.phase.state.upper        = repmat(stateMax, 1, numAgents);

bounds.phase.finalstate.lower   = finalStateLower;
bounds.phase.finalstate.upper   = finalStateUpper;

bounds.phase.control.lower      = repmat(umin, 1, numAgents);
bounds.phase.control.upper      = repmat(umax, 1, numAgents);

bounds.phase.integral.lower     = 0;
bounds.phase.integral.upper     = 1e6;

bounds.phase.path.lower         = [-1e3 * ones(1, auxdata.numObstacles*numAgents), -27*ones(1, numAgents-1)];   % just slightly larger than map
bounds.phase.path.upper         = [-1 * ones(1, auxdata.numObstacles*numAgents), zeros(1, numAgents-1)];    % min distance to obstacles

guess.phase.time = [t0; tfmax];
guess.phase.state = [initState; finalStateGuess];
guess.phase.control = repmat([0, 0], 2, numAgents);
guess.phase.integral = 0;

% mesh.method = 'hp-LiuRao-Legendre';
mesh.method = 'hp-PattersonRao';
% mesh.tolerance = 1e-6; 
% mesh.maxiterations = 25;
mesh.tolerance = 1e-3; 
mesh.maxiterations = 1;
% mesh.colpointsmin = 4;
% mesh.colpointsmax = 10;
mesh.colpointsmin = 4;
mesh.colpointsmax = 10;

% ----------------------------------------------------------------------- %
% Set up solver
% ----------------------------------------------------------------------- %
setup.name = 'Info-Seeking-Control';
setup.functions.continuous          = @infoControlContinuous;
setup.functions.endpoint            = @infoControlEndpoint;
setup.auxdata                       = auxdata;
setup.bounds                        = bounds;
setup.guess                         = guess;
setup.mesh                          = mesh;
setup.nlp.solver                    = 'ipopt';

% setup.derivatives.supplier          = 'adigator';
% setup.derivatives.derivativelevel   = 'second';
% setup.method                        = 'RPM-Differentiation';

setup.derivatives.supplier          = 'sparseCD';
setup.derivatives.derivativelevel   = 'second';
setup.method                        = 'RPM-Differentiation';

setup.scales.method                 = 'automatic-bounds';

% ----------------------------------------------------------------------- %
% Solve problem and extract solution
% ----------------------------------------------------------------------- %
output = gpops2(setup);
