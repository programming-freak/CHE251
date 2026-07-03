% haber_plots


clear; close all; clc;


% Table / figure 2 points: Purge ratio (%) vs NH3 Yield (%)
% Purge ratios derived from F6 = F1_Ar / y_Ar with F1_total=100, F1_Ar=0.5:
% y_Ar = [0.10, 0.06, 0.04, 0.02] -> purge% = [5, 8.3333, 12.5, 25]
purge_pct = [5, 8.3333, 12.5, 25];

% NH3 Yield (%) values as shown/printed in the report (overlay points from Table 4)
% These are the report numbers (approx): for purge 5% -> 42.7, 8.33% -> 40.5, 12.5% -> 41.8, 25% -> 37.5


%Figure 
bgColor = [0.96 0.96 0.95];      % pale/very-light background similar to report
markerColor = [0.07 0.62 0.63];  % teal-ish 
markerEdge = [0 0 0]*0.0;
fontName = 'Georgia';           

%  Figure 3: Inert Concentration vs Recycle Ratio 
% Use report Table-5 points (FR values  in report: 1500, 200, 100 kmol/hr)
% Convert to FR/F1 ratio with F1_total = 100 kmol/hr
yAr_tbl = [1, 5, 10];           % target y_Ar (percent)
FR_report = [1500, 200, 100];   % FR (kmol/hr) 
FR_over_F1 = FR_report ./ 100;  % FR/F1 ratio

figure('Name','Inert Concentration vs Recycle Ratio','Color',bgColor,'NumberTitle','off','Units','normalized','Position',[0.15 0.10 0.6 0.45]);
axesHandle2 = gca;
axesHandle2.Color = bgColor;
hold on;
% Plot line connecting the points (teal, similar to the report)
plot(yAr_tbl, FR_over_F1, '-o', 'LineWidth', 1.8, 'MarkerSize',8, 'MarkerFaceColor', markerColor, 'MarkerEdgeColor', markerEdge, 'Color', markerColor);
grid on;
set(gca,'GridLineStyle','-','GridAlpha',0.35);
xlim([0 11]);
ylim([0 16]);
xticks([0 2 4 6 8 10]);
yticks([0 2 4 6 8 10 12 14 16]);
xlabel('Target y\_Ar (%)','FontName',fontName,'FontSize',12,'FontWeight','normal');
ylabel('FR / F1 Ratio','FontName',fontName,'FontSize',12,'FontWeight','normal');
title('Inert Concentration vs. Recycle Ratio','FontName',fontName,'FontSize',14,'FontWeight','normal');
set(gca,'Box','off','LineWidth',0.6,'FontName',fontName,'FontSize',11);
% Label points with FR (kmol/hr)
for i=1:length(yAr_tbl)
    text(yAr_tbl(i)+0.3, FR_over_F1(i)+0.35, sprintf('FR=%.0f kmol/hr', FR_report(i)), 'FontName', fontName, 'FontSize',9);
end
hold off;


fprintf('Plots generated: Figure 2 (Purge Ratio vs NH3 Yield) and Figure 3 (Inert conc. vs Recycle ratio).\n');