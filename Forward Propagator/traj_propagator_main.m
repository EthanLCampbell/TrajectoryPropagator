%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TRAJECTORY PROPAGATION MAIN FUNCTION
%% Author: Ethan Labianca-Campbell 
%          Aeronautical & Astronautical Engineering, Purdue University
%% Contact Me: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - Email: ethan@labianca-campbell.com
% - LinkedIn: https://www.linkedin.com/in/ethan-labianca-campbell/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; clear all;
addpath(genpath("Support Functions"))
addpath(genpath("Vehicle"))
addpath(genpath("Propagator"))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FLIGHT OPTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% FLIGHT VEHICLE 
%-------------------------------------------------------------------------%

% PAYLOAD % 
ploptions = ["TEST_FV","CUSTOM"];
pl = ploptions(1); % **USER INPUT**

% ROCKET BOOSTER %
rmoptions = ["TEST_RM","CUSTOM"];
rm = rmoptions(1); % **USER INPUT**

% AIR-BREATHING ENGINE % 
aboptions = ["NONE","TEST_AB","CUSTOM"];
ab = aboptions(2); % **USER INPUT**

%% FLIGHT PROFILE 
%-------------------------------------------------------------------------%
% Gun Launch             - 0 (WIP)
% Rocket Launch          - 1 (WIP)
% Guided Rocket Launch   - 2 (WIP)
% Air-breathing boost    - 3 (WIP)
% Ballistic Arc          - 4 (WIP)
% Low-Altitude Cruise    - 5 (WIP)
% PULL-UP MANEUVER       - 6 (WIP)
% KELLEY GLIDE MANEUVER  - 7 (WIP)
% CONSTANT ALTITUDE HOLD - 8 (WIP)
% TARGET FINAL STATE     - 9 (WIP)

%profile = [1 3 5 6];
profile = [0]; %just gun launch to see if propagator makes sense w/ kinematics

%% INITIAL CONDITIONS
init = struct;
init.GAM0 = [50]; %flight path angle (measured from ground) [degrees]
init.ALT0 = [0]; %initial altitude [m]

%% CUSTOM VEHICLE SPECS 
PL = struct;
if strcmp(pl,"CUSTOM")
    PL.name = ["Squeebus"];
    PL.mTotal = [20]; %Payload mass [kg]
    PL.Dref = [0.127]; %Diameter [m]
    PL.Lref = [0.2]; %Length [m]
    PL.Sref = pi*(PL.Dref/2)^2; %Frontal area [m]
end
RM = struct;
if strcmp(rm,"CUSTOM")
    RM.name = ["Big_long_guy"];
    RM.mTotal = [200]; %Rocket motor mass [kg]
    RM.mFuel = [60]; %Propellant mass [kg]
    RM.Dref = [0.127]; %Motor diameter [m]
    RM.Lref = [1.778]; %Motor length [m]
    RM.Tavg = [15000]; %Average Thrust [N]
    RM.tBurn = [10]; %Burn Time [s]
end
AB = struct;
if strcmp(ab,"CUSTOM")
    AB.name = ["Big_long_guy"];
    AB.mTotal = [200]; %Rocket motor mass [kg]
    AB.mFuel = [60]; %Propellant mass [kg]
    AB.Dref = [0.127]; %Motor diameter [m]
    AB.Lref = [1.778]; %Motor length [m]
    %% more info needed - cycle analysis integration put somewhere? 
end

[MISSION] = mission_builder(profile,PL,RM,AB);

[STATE] = states_intialization(init);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%