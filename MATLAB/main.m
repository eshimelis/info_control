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

% rectangles
% obstacles.pos = [20, 0;
%                  60, 40;
%                  %60, 0
%                  ];
% 
% obstacles.dim = [10, 60;
%                  10, 60;
%                  %10, 10
%                  ]; 

% circles
obstacles.pos = [40, 60;
                 80, 20;
                 70, 40;
                 10, 20;
                 60, 50];

obstacles.radius = [16;
                    10;
                    15;
                    10;
                    15];

start.pos = [1, 1];
start.vel = [0, 0];

goal.pos = [90, 60];
goal.vel = [0, 0];

numAgents = 5;

%% Call GPOPS-II main file
infoControlGPOPSMain;

%% Plot results
infoControlPlot;
