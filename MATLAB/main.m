%-----------------------------------------------------------%
% 16.32 - Principles of Optimal Control and Estimation      %
% Term Project                                              %
%-----------------------------------------------------------%
% Information-Seeking Control of Multi-Agent Systems        %
%                                                           %
% Author: Eyassu Shimelis                                   %
% Created: April/May 2020                                   %
% main.m - Main file which sets up problem and call GPOPS.   %
%-----------------------------------------------------------%

clear all; close all;
run("/Users/eshimelis/Documents/MATLAB/adigator/startupadigator.m")
%% Create Map

% Example Map (square bounds, rectangular prism obstacles)
% +--------------------------+
% |   +-+                    |     
% |   | |         Start -> O | 
% |   | |                    |
% |   +-+          +--+      |    
% |                |  |      |
% |                |  |      |
% |   +-----+      |  |      |   
% |   |     |      +--+      |
% |   +--+  |                |
% |      |  |                |
% |      +--+                |
% |                          |
% |X <- Goal                 |              
% +--------------------------+

map.bounds.x = [0, 100];
map.bounds.y = [0, 100];

% circles
obstacles.pos = [%30, 40;
                 30, 20;
                 70, 30;
                 30, 70;
                 70, 80;
                 50, 50;
                 ];

obstacles.radius = [%16;
                    5;
                    5;
                    5;
                    5;
                    5
                    ];

start.pos = [5, 5];
start.vel = [0, 0];

goal.pos = [90, 90];
goal.vel = [0, 0];

numAgents = 4;

%% Call GPOPS-II main file
infoControlGPOPSMain;

%% Plot results
infoControlPlot;

animatedPlot;

%% Save Workspace
save(datestr(now, 'mm-dd-yy-HH-MM-SS'));