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
auxdata.obstacle = obstacle;

% --------------------------------------------------------------%
%           Set up bounds on state, control, and time           %
% --------------------------------------------------------------%
t0 = 0;
tfmin = 0; tfmax = 1e4;
vmin = -20; vmax = 20;
umin = -1; umax = 1;

initState = [start.pos, start.vel];
finalState = [goal.pos, goal.vel];

bounds.phase.initialtime.lower  = t0;
bounds.phase.initialtime.upper  = t0;
bounds.phase.finaltime.lower    = tfmin;
bounds.phase.finaltime.upper    = tfmax;

bounds.phase.initialstate.lower = initState;
bounds.phase.initialstate.upper = initState;

bounds.phase.state.lower        = [min(map.bounds.x), min(map.bounds.y), vmin, vmin];
bounds.phase.state.upper        = [max(map.bounds.x), max(map.bounds.y), vmax, vmax];

bounds.phase.finalstate.lower   = finalState;
bounds.phase.finalstate.upper   = finalState;

bounds.phase.control.lower      = [umin, umin];
bounds.phase.control.upper      = [umax, umax];

bounds.phase.integral.lower     = 0;
bounds.phase.integral.upper     = 1e4;

bounds.phase.path.lower         = [-1e4];   % just slightly larger than map
bounds.phase.path.upper         = [-10];    % min distance to obstacles

guess.phase.time = [t0; tfmax];
guess.phase.state = [initState; finalState];
guess.phase.control = [0, 0; 0, 0];
guess.phase.integral = 0;

mesh.method = 'hp-PattersonRao';
mesh.tolerance = 1e-6; 
mesh.maxiterations = 25;
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

setup.derivatives.supplier          = 'adigator';
setup.derivatives.derivativelevel   = 'second';
setup.method                        = 'RPM-Differentiation';

setup.scales.method                 = 'automatic-bounds';

% ----------------------------------------------------------------------- %
% Solve problem and extract solution
% ----------------------------------------------------------------------- %
output = gpops2(setup);
