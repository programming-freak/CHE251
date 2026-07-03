clear; close all; clc;

%coordinates 
purge = [5, 8.33, 12.5, 25];          % x-values
yield = [42.9, 41.8, 40.5, 37.7];     % y-values 
labels = {'y_{Ar}=10%','y_{Ar}=4%','y_{Ar}=6%','y_{Ar}=2%'};

% Sort for left→right plot
[purge_s, idx] = sort(purge);
yield_s = yield(idx);
labels_s = labels(idx);

% Plot
figure;
scatter(purge_s, yield_s, 80, 'filled'); hold on;
plot(purge_s, yield_s, 'LineWidth', 1.4);

% Axis styling 
grid on;
xlim([0 27]);
ylim([36 44]);
xticks([5 10 15 20 25]);
yticks([37 38 39 40 41 42 43]);

xlabel('Purge Ratio (%)');
ylabel('NH_3 Yield (%)');
title('Purge Ratio vs NH3 Yield');

% Label each point
for i = 1:length(purge_s)
    text(purge_s(i)+0.4, yield_s(i)-0.25, labels_s{i});
end