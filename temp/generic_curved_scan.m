R_min = 100; R_step = 50; R_max = 1000;
model = mccode('generic_curved.instr');
name = 'H3-0-DEDM';
parameters.guide_length=12;
parameters.sample_width=0.03;
parameters.sample_height=0.1;
parameters.guide_start_width=0.03;
parameters.guide_start_height=0.1;
parameters.source_lambda_min=4.85;
parameters.source_lambda_max=4.95;
parameters.cold_regime=1;



parameters.R = R_min:R_step:R_max;
results = iData(model,parameters);
sum_R = sum(results, 0);

fig=figure;
plot(R_min:R_step:R_max,sum_R,'LineWidth',2);
title([name ' scan R'])
grid on
xlabel('R, m')
ylabel('I, arb.u.')
legend('Curvature radius')
print(gcf,[name 'R_scan'],'-dpng','-r300')
%matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
saveas(fig,[name 'R_scan.fig']);