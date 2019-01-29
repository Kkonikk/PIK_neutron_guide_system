L_min = 1; L_step = 2; L_max = 31;
w_min = 0.05; w_step = 0.005; w_max = 0.15;
model = mccode('../generic_guides/generic_expander.instr');
name = 'H3-4-NSE';
parameters.sample_width = 0.05;
parameters.sample_height = 0.05;
parameters.guide_sample_dist = 4;
parameters.guide_start_width=0.03;
parameters.guide_start_height=0.1;
parameters.guide_length = 60;
parameters.source_lambda_min=4.85;
parameters.source_lambda_max=4.95;
parameters.cold_regime = 1;
parameters.guide_exit_height = 0.05;
parameters.m_str_side = 1;
parameters.m_top = 1;
parameters.guide_exp_length = L_min:L_step:L_max;
parameters.guide_exit_width = w_min:w_step:w_max;


results = iData(model,parameters);
sum_R = sum(results, 0);

% fig=figure;
% plot(R_min:R_step:R_max,sum_R,'LineWidth',2);
% title([name ' scan R'])
% grid on
% xlabel('R, m')
% ylabel('I, arb.u.')
% legend('Curvature radius')
% print(gcf,[name 'R_scan'],'-dpng','-r300')
% %matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
% saveas(fig,[name 'R_scan.fig']);