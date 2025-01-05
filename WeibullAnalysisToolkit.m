% Weibull Analysis: Reliability, PDF, CDF, Hazard Rate


disp('Weibull Analysis Toolkit');
disp('=========================');

% Step 1: Input Weibull Parameters
shape_param = input('Enter the shape parameter (β): '); % Shape parameter (β)
scale_param = input('Enter the characteristic life (η): '); % Scale parameter (η)
t_max = input('Enter the maximum time period for analysis: '); % Time period of interest
units = input('Enter the units (e.g., hours, cycles): ', 's'); % Units for time

% Step 2: Generate Time Points
t = linspace(0, t_max, 500); % Generate time points from 0 to t_max

% Step 3: Weibull Distribution Equations
% Probability Density Function (PDF): f(t)
pdf = (shape_param / scale_param) .* ((t / scale_param).^(shape_param - 1)) .* exp(- (t / scale_param).^shape_param);

% Cumulative Distribution Function (CDF): F(t)
cdf = 1 - exp(-(t / scale_param).^shape_param);

% Reliability Function (R(t))
reliability = exp(-(t / scale_param).^shape_param);

% Hazard Rate Function (h(t))
hazard_rate = (shape_param / scale_param) .* ((t / scale_param).^(shape_param - 1));

% Step 4: Display Characteristics of Shape Parameter
disp('Characteristics of Shape Parameter (β):');
if shape_param == 1
    disp('β = 1.0: Exponential distribution, constant failure rate');
elseif shape_param < 1
    disp('β < 1.0: Decreasing failure (hazard) rate');
elseif shape_param > 1
    disp('β > 1.0: Increasing failure (hazard) rate');
elseif abs(shape_param - 3.5) < 0.1
    disp('β = 3.5: Approximation of the normal distribution');
end

% Step 5: Plot the Functions
figure;

% Plot PDF
subplot(2, 2, 1);
plot(t, pdf, 'r', 'LineWidth', 1.5);
xlabel(['Time (' units ')']);
ylabel('PDF: f(t)');
title('Probability Density Function');
grid on;

% Plot CDF
subplot(2, 2, 2);
plot(t, cdf, 'b', 'LineWidth', 1.5);
xlabel(['Time (' units ')']);
ylabel('CDF: F(t)');
title('Cumulative Distribution Function');
grid on;

% Plot Reliability Function
subplot(2, 2, 3);
plot(t, reliability, 'g', 'LineWidth', 1.5);
xlabel(['Time (' units ')']);
ylabel('R(t)');
title('Reliability Function');
grid on;

% Plot Hazard Rate Function
subplot(2, 2, 4);
plot(t, hazard_rate, 'm', 'LineWidth', 1.5);
xlabel(['Time (' units ')']);
ylabel('h(t)');
title('Hazard Rate Function');
grid on;

% Step 6: Summary of Weibull Characteristics
fprintf('\nSummary of Weibull Characteristics:\n');
fprintf('Shape Parameter (β): %.4f\n', shape_param);
fprintf('Characteristic Life (η): %.4f %s\n', scale_param, units);
fprintf('At t = %.2f %s:\n', t_max, units);
fprintf('  Reliability (R(t)): %.4f\n', reliability(end));
fprintf('  CDF (F(t)): %.4f\n', cdf(end));
fprintf('  PDF (f(t)): %.4f\n', pdf(end));
fprintf('  Hazard Rate (h(t)): %.4f\n', hazard_rate(end));