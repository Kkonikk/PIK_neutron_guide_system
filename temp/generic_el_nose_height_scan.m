nose_length_min = 0.2; nose_length_step = 0.2; nose_length_max = 1;
height_min = 0.05; height_step= 0.05; height_max = 0.2;
model = mccode('../generic_guides/generic_half_elliptic_nose.instr');
name = 'H3-1-TAS';
height_res_max_I = [];
height_res_max_x = [];
for i = height_min:height_step:height_max
    parameters.sample_width=0.03;
    parameters.sample_height=0.1;
    parameters.guide_start_width=0.03;
    parameters.guide_start_height = i;
    parameters.source_lambda_min=4.85;
    parameters.source_lambda_max=4.95;
    parameters.cold_regime=1;

    parameters.m_side=6;
    parameters.m_top=6;
    parameters.sample_dist = 0.5;
    parameters.guide_length=20;
    parameter.loutw = 0.5;
    parameter.louth = 0.5;
    parameter.linw = parameters.nose_length+parameter.loutw;
    parameter.linh = parameters.nose_length+parameter.louth;
    parameters.nose_length = nose_length_min:nose_length_step:nose_length_max;
    results = iData(model,parameters);
    sum_L = sum(results, 0);
    plot(i,sum_L)
%     [a,b] = 
%     height_res_max_I = [height_res_max sum_L];
%     height_res_max_x = [height_res_max sum_L];
end
% fig=figure;
% plot(nose_length_min:nose_length_step:nose_length_max,sum_L,'LineWidth',2);
% title([name ' scan L, nose'])
% grid on
% xlabel('L, m')
% ylabel('I, arb.u.')
% legend('Nose length')
% print(gcf,[name 'L_scan'],'-dpng','-r300')
% %matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
% saveas(fig,[name 'L_scan.fig']);