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

function output = infoControlEndpointADiGatorGrd(input)
global ADiGator_infoControlEndpointADiGatorGrd
if isempty(ADiGator_infoControlEndpointADiGatorGrd); ADiGator_LoadData(); end
Gator1Data = ADiGator_infoControlEndpointADiGatorGrd.infoControlEndpointADiGatorGrd.Gator1Data;
% ADiGator Start Derivative Computations
output.objective.dv = input.phase.integral.dv; output.objective.f = input.phase.integral.f;
%User Line: output.objective = input.phase.integral;
output.objective.dv_size = 11;
output.objective.dv_location = Gator1Data.Index1;
end


function ADiGator_LoadData()
global ADiGator_infoControlEndpointADiGatorGrd
ADiGator_infoControlEndpointADiGatorGrd = load('infoControlEndpointADiGatorGrd.mat');
return
end