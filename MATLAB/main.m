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

obstacle.pos = [20, 20];
obstacle.dim = [20, 20]; 

start.pos = [1, 1];
start.vel = [0, 0];

goal.pos = [75, 70];
goal.vel = [0, 0];


%% Call GPOPS-II main file
infoControlGPOPSMain;

%% Plot results
infoControlPlot;