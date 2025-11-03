%% MATLAB code to generate discrete-time signal plots (matching your images)
clear; close all; clc;

% -------------------------------------------------------------------------
% Discrete-time index n from -30 to 30 (sufficient range)
% -------------------------------------------------------------------------
n = -30:30;

% -------------------------------------------------------------------------
% 1) Discrete-time unit impulse δ[n]
% -------------------------------------------------------------------------
impulse = (n == 0);  % 1 at n=0, 0 elsewhere

% -------------------------------------------------------------------------
% 2) Unit step sequence u[n]
% -------------------------------------------------------------------------
step = (n >= 0);

% -------------------------------------------------------------------------
% 3) Unit ramp sequence r[n] = n * u[n]
% -------------------------------------------------------------------------
ramp = n .* (n >= 0);

% -------------------------------------------------------------------------
% 4) Discrete-time exponential: exp(-|n|/2)  (decays on both sides)
% -------------------------------------------------------------------------
expSig = exp(-abs(n)/2);

% -------------------------------------------------------------------------
% 5) Signum function sgn(n)
% -------------------------------------------------------------------------
sgn = sign(n);  % -1 for n<0, 0 at n=0, +1 for n>0

% -------------------------------------------------------------------------
% 6) Discrete-time sinc function: sinc(n) = sin(πn)/(πn), sinc(0)=1
% -------------------------------------------------------------------------
sinc_n = zeros(size(n));
for i = 1:length(n)
    if n(i) == 0
        sinc_n(i) = 1;
    else
        sinc_n(i) = sin(pi*n(i)) / (pi*n(i));
    end
end

% -------------------------------------------------------------------------
% Plotting - Figure 1 (3x2 layout)
% -------------------------------------------------------------------------
figure('Name','Figure 1','Position',[100 100 900 700]);

% --- Top row ---
subplot(3,2,1);
stem(n, impulse, 'b', 'LineWidth',1.5, 'MarkerFaceColor','b');
axis([-10 10 -0.2 1.2]); grid on;
title('Discrete time unit impulse signal');
xlabel('discrete time n --->'); ylabel('amplitude');

subplot(3,2,2);
stem(n, step, 'b', 'LineWidth',1.5, 'MarkerFaceColor','b');
axis([-10 10 -0.2 1.2]); grid on;
title('Unit step sequence');
xlabel('discrete time n --->'); ylabel('amplitude');

% --- Middle row ---
subplot(3,2,3);
stem(n, ramp, 'b', 'LineWidth',1.5, 'MarkerFaceColor','b');
axis([-10 10 -2 10]); grid on;
title('Unit ramp sequence');
xlabel('discrete time n --->'); ylabel('amplitude');

subplot(3,2,4);
stem(n, expSig, 'b', 'LineWidth',1.5, 'MarkerFaceColor','b');
axis([-10 10 -0.2 6]); grid on;
title('discrete time exponential signal');
xlabel('discrete time n --->'); ylabel('amplitude');

% --- Bottom row (full width) ---
subplot(3,2,[5 6]);
stem(n, sgn, 'b', 'LineWidth',1.5, 'MarkerFaceColor','b');
axis([-10 10 -1.2 1.2]); grid on;
title('discrete time signum function');
xlabel('discrete time n --->'); ylabel('amplitude');

% -------------------------------------------------------------------------
% Plotting - Figure 2: Discrete sinc function (zoomed out)
% -------------------------------------------------------------------------
figure('Name','Figure 2','Position',[100 100 560 420]);
stem(n, sinc_n, 'b', 'LineWidth',1.5, 'MarkerFaceColor','b');
axis([-30 30 -0.4 1.1]); grid on;
title('discrete time sinc function');
xlabel('discrete time n --->'); ylabel('amplitude');

% Optional: Save figures (uncomment to save)
% saveas(gcf, 'figures/discrete_sinc.png');
% figure(1); saveas(gcf, 'figures/discrete_signals.png');