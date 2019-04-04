% This script solves the Fitzhugh-Nagumo equations numerically
%% 
function UU=fn(rho,R,diffcoeff);
global n m M deltax DDD DD
global x maxx UU c1u c8u iniflag terminate_flag lastUU lastT run
%global rho R diffcoeff

terminate_flag=-1;  %% flag that stops computation when the rate of change is below a threshold set in TestFunction-
n=150;  % # of sample points (in one spatial dimension)



maxx=15;  %% domain is a 1 times 1 array

%diffcoeff=0.02;  % diffusioncoefficient

%a=linspace(.01,0.011, n);  % vectors
%aa=vectorrepresentation(kron(a,ones(n,1))); %%0.1;  aa varies along x-axis; constant on x=const

%R=-0.04;

%rho=3;

deltax=maxx/(n-1);

% definition of various matrices (needs to be called only once)
if(iniflag==1)
initialize_matrices();
end
iniflag=0;

DDD= sparse(blkdiag(diffcoeff*DD, DD)); % diffusion matrix  size 3n^2 by 3n^2
%set an error
options=odeset('RelTol',1e-5, 'Events',@eventsteadystatereached);
%%initial conditions
x=linspace(0,maxx,n); % x is the interval [0,maxx]; the whole domain is the Cartesian product [0,maxx]\times [0.maxx]
%with periodic boundary conditions;
% 

disp(['run: rho=' num2str(rho) ' R=' num2str(R) ' d=' num2str(diffcoeff)]);
UU0=initial_conditions();
%UU0=UU(3,:);

lastUU=UU0;
lastT=0;
tic
%timespan
%tspan = [0,25,2000];
%tspan=[0,1, 50];  %% to compute until error is small, choose very large endtime; change threshold in Testfunction
tspan=[0,1, 20]; 
%call the solver
%disp('Calling ODE solver...');
 [t,UU,te,ye,ie] = ode45(@(T,Y)TestFunction(T,Y,rho,R),tspan,UU0,options);
%disp(['ODE solved at time t=' num2str(te)]);
alltime=toc;

%disp(['This took' num2str(alltime) 'seconds.']);

%filenameall=['longterm_data_all_R_' num2str(R) '_rho' num2str(R) 'diffcoeff_' num2str(diffcoeff) 'run_' num2str(run) '.mat'];
%save(filenameall);

