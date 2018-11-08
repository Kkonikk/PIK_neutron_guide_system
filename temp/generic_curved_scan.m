m_min = 1; m_step = 1; m_max = 6;
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



parameters.m_side = m_min:m_step:m_max;
parameters.m_top = 1;
results_side = iData(model,parameters);
sum_side = sum(results_side, 0);

parameters.m_side = 1;
parameters.m_top = m_min:m_step:m_max;
results_top = iData(model,parameters);
sum_top = sum(results_top, 0);

fig=figure;
plot(m_min:m_step:m_max,sum_side,m_min:m_step:m_max,sum_top,'LineWidth',2);
title([name ' scan R'])
grid on
xlabel('m')
ylabel('I, arb.u.')
legend('side','top')
print(gcf,[name 'm_scan'],'-dpng','-r300')
%matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
saveas(fig,[name 'm_scan.fig']);