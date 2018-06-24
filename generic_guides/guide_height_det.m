   close all ; clear all; clc;
   set(0,'DefaultTextInterpreter', 'latex');
   set(0,'DefaultAxesFontSize',12);
   set(0,'DefaultTextFontSize',12);
    
   m_side = 2;
   m_top = 6;
   R0=0.99;
   alpha = 3.3;
   
   instr_name = 'SONATA';
   guide_length = 58;
   focal_dist = 0.4;
   sample_height = 0.01; 
   
   model = 'generic_parabolic_nose';
   
    if strcmp(model, 'generic_parabolic_nose')==1
        model_name = 'par';
    else
        model_name = 'ell';
    end
   
   
   ncount=1e4;
   lambda_min = 20;
   lambda_max = 20.1;
  
   guide_h = [0.16:0.02:0.2];
   nose_length = [0.5:0.5:15];
   
   p = struct;

   fig = figure; hold on;
   tic
for i=1:length(guide_h)
         [p.(['p' num2str(i)]),m]=mcstas(model,struct('guide_length',guide_length,'nose_length',nose_length,'m_side',m_side,'m_top',m_top,'focal_dist',focal_dist,'R0',R0,'alpha',alpha,'sample_height',sample_height, 'guide_start_width', 0.03, 'guide_start_height', guide_h(i), 'source_lambda_min', lambda_min, 'source_lambda_max', lambda_max, 'cold_regime',1),struct('ncount',ncount,'compile','yes'));
        %p.(['p' num2str(i)]).signal = nose_length;
        
        plot(nose_length, p.(['p' num2str(i)]).signal,'.','MarkerSize',20);
        for_legend{i} = num2str(guide_h(i));
        
        a(i) = max(p.(['p' num2str(i)]).signal);
end
   toc
   
legend(for_legend);


title('Скан по длине носа');
xlabel('Длина носа');
ylabel('Интенсивность');

figname = ['figs/' instr_name '_' model_name '_lenght_scan_' num2str(lambda_min) 'AA'];
matlabfrag(figname,'epspad',[10,10,10,10]);
saveas(fig, [figname '.fig']);

max_a = max(a);
a = a./max_a;

fig = figure; 
plot(guide_h, a);
title('Скан по высоте');
xlabel('высота нв');
ylabel('Отн. эффективность');

figname = ['figs/' instr_name '_' model_name '_height_scan_' num2str(lambda_min) 'AA' ];
matlabfrag(figname,'epspad',[10,10,10,10]);
saveas(fig, [figname '.fig']);