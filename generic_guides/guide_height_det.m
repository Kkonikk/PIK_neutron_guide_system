addpath(genpath('../../ifit-1.10'));
addpath(genpath('../../PIK_neutron_guide_system'));

close all ; clear all; clc;
   set(0,'DefaultTextInterpreter', 'latex');
   set(0,'DefaultAxesFontSize',12);
   set(0,'DefaultTextFontSize',12);
    
   m_side = 2;
   m_top = 6;
   R0=0.99;
   alpha = 3.3;
   
   instr_name = 'TOF_150';
   guide_length = 107;
   focal_dist = 0.15;
   sample_height = 0.01; 
   
   model = 'generic_half_elliptic_nose';
   
    if strcmp(model, 'generic_parabolic_nose')==1
        model_name = 'par';
    else
        model_name = 'ell';
    end
   
   
   ncount=1e5;
   lambda_min = 12;
   lambda_max = 12.1;
  
   guide_h = [0.18:0.02:0.2];
   nose_length = [0.5:0.5:7];
   
   p = struct;

   fig = figure; hold on; box on;
   
for i=1:length(guide_h)
         [p.(['p' num2str(i)]),m]=mcstas(model,struct('guide_length',guide_length,'nose_length',nose_length,'m_side',m_side,'m_top',m_top,'focal_dist',focal_dist,'R0',R0,'alpha',alpha,'sample_height',sample_height, 'guide_start_width', 0.03, 'guide_start_height', guide_h(i), 'source_lambda_min', lambda_min, 'source_lambda_max', lambda_max, 'cold_regime',1),struct('ncount',ncount));
              
        plot(nose_length, p.(['p' num2str(i)]).signal,'-','Linewidth',3);
        for_legend{i} = num2str(guide_h(i));
        
        a(i) = max(p.(['p' num2str(i)]).signal);
end
   
legend(for_legend, 'Location','southeast');

title('Скан по длине носа');
xlabel('Длина носа');
ylabel('Интенсивность');

figname = ['figs/' instr_name '_' model_name '_length_scan_' num2str(lambda_min) 'AA'];
matlab2tikz([figname '.tex'] , 'width', '\textwidth');
saveas(fig, [figname '.fig']);

max_a = max(a);
a = a./max_a;

fig = figure; box on;
plot(guide_h, a,'-','Linewidth',3);
legend('hide');
title('Скан по высоте');
xlabel('высота нв');
ylabel('Отн. эффективность');

figname = ['figs/' instr_name '_' model_name '_height_scan_' num2str(lambda_min) 'AA' ];
matlab2tikz([figname '.tex'], 'width', '\textwidth');
saveas(fig, [figname '.fig']);