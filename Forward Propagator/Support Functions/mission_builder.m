function [MISSION] = mission_builder(profile,PL,RM,AB)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MISSION BUILDER 
%% Author: Ethan LC 
%% Notes: 
%  Generates "MISSION" structure to be passed into propagator for quick
%  variable access. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% PHASES
MISSION.phase_count = length(profile);
MISSION.phases = profile;

%% VEHICLE
MISSION.FV.PL = PL;
MISSION.FV.RM = RM;
MISSION.FV.AB = AB;

%% 

