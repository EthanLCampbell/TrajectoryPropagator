function [STATE] = states_initialization(init)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MISSION BUILDER 
%% Author: Ethan LC 
%% Notes: 
%  Generates "STATE" struct with vectors; vectors will include range,
%  crossrange, altitude, velocity, etc...
%
% x(1) = range, x(2) = crossrange, x(3) = altitude
% u(1) = forward velocity, u(2) = cross-velocity, u(3) = vertical velocity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%position
ALT0 = init.ALT0;

%angles
GAM0 = init.GAM0;
ALF0 = 0;
PHI0 = 0;

%moments
P = 0;
Q = 0;
R = 0;

%pack
STATE.x = [0,0,ALT0];
STATE.u = [0,0,0];
STATE.angle = [GAM0,ALF0,PHI0];
STATE.moments = [P,Q,R];