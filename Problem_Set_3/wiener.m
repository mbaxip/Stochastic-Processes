function [X,t] = wiener(T,alpha)
% [X,t] = wiener(T,alpha)

% alpha: ratio of the step size squared to time interval s^2/T
% T: time step
% Z: Increment (Bernoulli) vector iid process values at the times in the vector t

t = 0:T:1; % generate the set of time points
s = sqrt(alpha*T); % set the step size s of the discrete random walk
z = round(rand(length(t),1)); % Bernoulli Trials via rounded uniform RVs
jumps = s*( sign(z - .5) );
X = cumsum(jumps);

%% Plot sample paths
% [X,t] = wiener(0.01,10);alpha = 1,0.1,10,100
% stairs(t,X)
% title('Wiener Process for alpha = 10, T = 0.00001')
% ylabel('Wiener Process W(t)')
% xlabel('time')

%% Plot wienerp.m sample paths
% [X,t] = wienerp(10000,[0:0.1:1],0.001,2);
% figure()
% for i = 1:4
% hold on
% stairs(t,X(i,:))
% end
% xlabel('time (t)')
% ylabel('Wiener process X(t)')
% title('Sample paths of a wiener process')

%% Plot the mean and autocovariance function
% m_x = mean(X,1); % theoretical 0
% autocov = mean((X - repmat(m_x,10000,1)).^2); % theoretical alpha*time
% plot(t,mean(X,1))
% axis([0 1 -0.5 0.5])
% xlabel('time (t)')
% ylabel('mean of wiener process')
% title('mean of wiener process: alpha = 2, T = 0.001')
%  plot(t,autocov)
%  xlabel('time (t)')
%  ylabel('Variance  of wiener process')
% title('Autocovariance of wiener process: alpha = 2, T = 0.001')