function [ state0 ] = initial_conditions( )
global  n x
global cc8b

%% computes initial conditions

% 
 c1u0=-1+0.3*(rand(n^2,1)-0.5); % cos(4*pi*x'/maxx);
% 
 c8u0=-1+0.3*(rand(n^2,1)-0.5);  % cos(4*pi*x'/maxx);

% 
%c1u0=2*(rand(n^2,1)-0.5); % cos(4*pi*x'/maxx);
% 
%c8u0=2*(rand(n^2,1)-0.5);  % cos(4*pi*x'/maxx);


state0=[c1u0' c8u0']';

end

