% This code was generated using ADiGator version 1.4
% ©2010-2014 Matthew J. Weinstein and Anil V. Rao
% ADiGator may be obtained at https://sourceforge.net/projects/adigator/ 
% Contact: mweinstein@ufl.edu
% Bugs/suggestions may be reported to the sourceforge forums
%                    DISCLAIMER
% ADiGator is a general-purpose software distributed under the GNU General
% Public License version 3.0. While the software is distributed with the
% hope that it will be useful, both the software and generated code are
% provided 'AS IS' with NO WARRANTIES OF ANY KIND and no merchantability
% or fitness for any purpose or application.

function phaseout = infoControlContinuousADiGatorHes(input)
global ADiGator_infoControlContinuousADiGatorHes
if isempty(ADiGator_infoControlContinuousADiGatorHes); ADiGator_LoadData(); end
Gator1Data = ADiGator_infoControlContinuousADiGatorHes.infoControlContinuousADiGatorHes.Gator1Data;
Gator2Data = ADiGator_infoControlContinuousADiGatorHes.infoControlContinuousADiGatorHes.Gator2Data;
% ADiGator Start Derivative Computations
auxdata = input.auxdata;
%User Line: auxdata = input.auxdata;
rect.f = [auxdata.obstacle.pos auxdata.obstacle.dim];
%User Line: rect = [auxdata.obstacle.pos, auxdata.obstacle.dim];
t.dV = input.phase.time.dV(:,1);
t.f = input.phase.time.f(:,1);
%User Line: t       = input.phase.time(:, 1);
x.dV = input.phase.state.dV(:,1);
x.f = input.phase.state.f(:,1);
%User Line: x       = input.phase.state(:, 1);
y.dV = input.phase.state.dV(:,2);
y.f = input.phase.state.f(:,2);
%User Line: y       = input.phase.state(:, 2);
xdot.dV = input.phase.state.dV(:,3);
xdot.f = input.phase.state.f(:,3);
%User Line: xdot    = input.phase.state(:, 3);
ydot.dV = input.phase.state.dV(:,4);
ydot.f = input.phase.state.f(:,4);
%User Line: ydot    = input.phase.state(:, 4);
ux.dV = input.phase.control.dV(:,1);
ux.f = input.phase.control.f(:,1);
%User Line: ux    = input.phase.control(:,1);
uy.dV = input.phase.control.dV(:,2);
uy.f = input.phase.control.f(:,2);
%User Line: uy    = input.phase.control(:,2);
xddot.dV = ux.dV;
xddot.f = ux.f;
%User Line: xddot = ux;
yddot.dV = uy.dV;
yddot.f = uy.f;
%User Line: yddot = uy;
cada2f1 = size(xdot.f,1);
cada1td1 = zeros(cada2f1,4);
cada1td1(:,1) = xdot.dV;
cada1td1(:,2) = ydot.dV;
cada1td1(:,3) = xddot.dV;
cada1td1(:,4) = yddot.dV;
phaseout.dynamics.dV = cada1td1;
phaseout.dynamics.f = [xdot.f ydot.f xddot.f yddot.f];
%User Line: phaseout.dynamics  = [xdot, ydot, xddot, yddot];
cadainput2_1.f = rect.f;
%User Line: cadainput2_1 = rect;
cada2f1 = size(x.f,1);
cada1td1 = zeros(cada2f1,2);
cada1td1(:,1) = x.dV;
cada1td1(:,2) = y.dV;
cadainput2_2.dV = cada1td1;
cadainput2_2.f = [x.f y.f];
%User Line: cadainput2_2 = [x, y];
cadaoutput2_1 = ADiGator_rect_coll1(cadainput2_1,cadainput2_2);
% Call to function: rect_coll
phaseout.path.dVdV = -cadaoutput2_1.dVdV;
phaseout.path.dV = uminus(cadaoutput2_1.dV);
phaseout.path.f = uminus(cadaoutput2_1.f);
%User Line: phaseout.path      = [-cadaoutput2_1];
cada2f1dV = 1.*ux.f.^(1-1).*ux.dV;
cada2f1 = ux.f.^1;
cada2f2dV = 2.*cada2f1dV;
cada2f2 = 2*cada2f1;
cada1f1dVdV = ux.dV.*cada2f2dV;
cada1f1dV = cada2f2.*ux.dV;
cada1f1 = ux.f.^2;
cada2f1 = size(t.dV,1);
cada1td1 = zeros(cada2f1,2);
cada1td1(:,2) = t.dV;
cada2f1 = cada1td1(:,1);
cada2f2dV = cada1f1dVdV;
cada2f2 = cada2f1 + cada1f1dV;
cada1td1dV = cada2f2dV;
cada1td1(:,1) = cada2f2;
cada1f2dVdV = cada1td1dV; cada1f2dV = cada1td1;
cada1f2 = t.f + cada1f1;
cada2f1dV = 1.*uy.f.^(1-1).*uy.dV;
cada2f1 = uy.f.^1;
cada2f2dV = 2.*cada2f1dV;
cada2f2 = 2*cada2f1;
cada1f3dVdV = uy.dV.*cada2f2dV;
cada1f3dV = cada2f2.*uy.dV;
cada1f3 = uy.f.^2;
cada2f1 = size(cada1f2dV,1);
cada1td1 = zeros(cada2f1,3);
cada1td1dV = cada1f2dVdV;
cada1td1(:,Gator1Data.Index1) = cada1f2dV;
cada2f1 = cada1td1(:,2);
cada2f2dV = cada1f3dVdV;
cada2f2 = cada2f1 + cada1f3dV;
cada2td1 = zeros(size(cada1td1,1),2);
cada2td1(:,2) = cada2f2dV;
cada2td1(:,1) = cada1td1dV(:,1);
cada1td1dV = cada2td1;
cada1td1(:,2) = cada2f2;
phaseout.integrand.dVdV = cada1td1dV; phaseout.integrand.dV = cada1td1;
phaseout.integrand.f = cada1f2 + cada1f3;
%User Line: phaseout.integrand = t + ux.^2 + uy.^2;
phaseout.dynamics.dV_size = [4 7];
phaseout.dynamics.dV_location = Gator1Data.Index2;
phaseout.integrand.dV_size = 7;
phaseout.integrand.dV_location = Gator1Data.Index3;
phaseout.path.dV_size = 7;
phaseout.path.dV_location = Gator1Data.Index4;
phaseout.integrand.dVdV_size = [phaseout.integrand.dV_size,7];
phaseout.integrand.dVdV_location = [phaseout.integrand.dV_location(Gator2Data.Index1,:), Gator2Data.Index2];
phaseout.path.dVdV_size = [phaseout.path.dV_size,7];
phaseout.path.dVdV_location = [phaseout.path.dV_location(Gator2Data.Index3,:), Gator2Data.Index4];
end
function output = ADiGator_rect_coll1(rect,point)
global ADiGator_infoControlContinuousADiGatorHes
Gator1Data = ADiGator_infoControlContinuousADiGatorHes.ADiGator_rect_coll1.Gator1Data;
Gator2Data = ADiGator_infoControlContinuousADiGatorHes.ADiGator_rect_coll1.Gator2Data;
% ADiGator Start Derivative Computations
%User Line: %rect_coll Determine the distance between a rectangle and point, 0 if on or
%User Line: % inside the rectangle
%User Line: %   rect should be a 4D vector [x, y, w, h], where [x, y] defines the botto
%User Line: %   left corner of the rectangle
rx.f = rect.f(1);
%User Line: rx = rect(1);
ry.f = rect.f(2);
%User Line: ry = rect(2);
rw.f = rect.f(3);
%User Line: rw = rect(3);
rh.f = rect.f(4);
%User Line: rh = rect(4);
px.dV = point.dV(:,1);
px.f = point.f(:,1);
%User Line: px = point(:, 1);
py.dV = point.dV(:,2);
py.f = point.f(:,2);
%User Line: py = point(:, 2);
cada1f1 = rx.f + rw.f;
cada2f1 = min(px.f,cada1f1);
cada2f2 = eq(px.f,cada2f1);
cada1f2dV = cada2f2.*px.dV;
cada1f2 = min(px.f,cada1f1);
cada2f1 = max(cada1f2,rx.f);
cada2f2 = eq(cada1f2,cada2f1);
dx.dV = cada2f2.*cada1f2dV;
dx.f = max(cada1f2,rx.f);
%User Line: dx = max(min(px, rx + rw), rx);
cada1f1 = ry.f + rh.f;
cada2f1 = min(py.f,cada1f1);
cada2f2 = eq(py.f,cada2f1);
cada1f2dV = cada2f2.*py.dV;
cada1f2 = min(py.f,cada1f1);
cada2f1 = max(cada1f2,ry.f);
cada2f2 = eq(cada1f2,cada2f1);
dy.dV = cada2f2.*cada1f2dV;
dy.f = max(cada1f2,ry.f);
%User Line: dy = max(min(py, ry + rh), ry);
cada1td1 = px.dV;
cada2f1 = uminus(dx.dV);
cada1td1 = cada1td1 + cada2f1;
cada1f1dV = cada1td1;
cada1f1 = px.f - dx.f;
cada2f1dV = 1.*cada1f1.^(1-1).*cada1f1dV;
cada2f1 = cada1f1.^1;
cada2f2dV = 2.*cada2f1dV;
cada2f2 = 2*cada2f1;
cada1f2dVdV = cada1f1dV.*cada2f2dV;
cada1f2dV = cada2f2.*cada1f1dV;
cada1f2 = cada1f1.^2;
cada1td1 = py.dV;
cada2f1 = uminus(dy.dV);
cada1td1 = cada1td1 + cada2f1;
cada1f3dV = cada1td1;
cada1f3 = py.f - dy.f;
cada2f1dV = 1.*cada1f3.^(1-1).*cada1f3dV;
cada2f1 = cada1f3.^1;
cada2f2dV = 2.*cada2f1dV;
cada2f2 = 2*cada2f1;
cada1f4dVdV = cada1f3dV.*cada2f2dV;
cada1f4dV = cada2f2.*cada1f3dV;
cada1f4 = cada1f3.^2;
cada2f1 = size(cada1f2dV,1);
cada1td1 = zeros(cada2f1,2);
cada1td1dV = cada1f2dVdV;
cada1td1(:,1) = cada1f2dV;
cada2f1 = cada1td1(:,2);
cada2f2dV = cada1f4dVdV;
cada2f2 = cada2f1 + cada1f4dV;
cada2td1 = zeros(size(cada1td1,1),2);
cada2td1(:,2) = cada2f2dV;
cada2td1(:,1) = cada1td1dV(:,1);
cada1td1dV = cada2td1;
cada1td1(:,2) = cada2f2;
cada1f5dVdV = cada1td1dV; cada1f5dV = cada1td1;
cada1f5 = cada1f2 + cada1f4;
cada1tf1dV = cada1f5dV(:,Gator2Data.Index1);
cada1tf1 = cada1f5(:,Gator1Data.Index1);
cada2tf1 = cada1tf1(:,Gator2Data.Index2);
cada2f1dV = (1/2)./sqrt(cada2tf1).*cada1tf1dV;
cada2f1dV(cada2tf1 == 0 & cada1tf1dV == 0) = 0;
cada2f1 = sqrt(cada1tf1);
cada2tf2 = cada2f1(:,Gator2Data.Index3);
cada2f2dV = -0.5./cada2tf2.^2.*cada2f1dV;
cada2f2 = 0.5./cada2f1;
cada2tf1 = cada1f5dV(:,Gator2Data.Index4);
cada2td1 = cada2tf1.*cada2f2dV;
cada2td1(:,Gator2Data.Index5) = cada2td1(:,Gator2Data.Index5) + cada2f2.*cada1f5dVdV;
output.dVdV = cada2td1;
output.dV = cada2f2.*cada1f5dV;
cada2f1 = eq(cada1tf1,0);
cada2f2 = eq(cada1f5dV,0);
cada2f3 = and(cada2f1,cada2f2);
cada2td2 = output.dVdV;
cada2tind1 = cada2f3(:,Gator2Data.Index6);
cada2td2(cada2tind1) = 0;
output.dVdV = cada2td2;
output.dV(cada2f3) = 0;
output.f = sqrt(cada1f5);
%User Line: output = sqrt((px - dx).^2 + (py - dy).^2);
end


function ADiGator_LoadData()
global ADiGator_infoControlContinuousADiGatorHes
ADiGator_infoControlContinuousADiGatorHes = load('infoControlContinuousADiGatorHes.mat');
return
end