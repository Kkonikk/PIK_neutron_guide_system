   close all ; clear all; clc;
   set(0,'DefaultTextInterpreter', 'latex');
   set(0,'DefaultAxesFontSize',12);
   set(0,'DefaultTextFontSize',12);
   
   ncount=1e5;
   model = 'generic_parabolic_nose';
   guide_length = 58;
   m_side = 2;
   m_top = 6;
   focal_dist = 0.25;
   R0=0.99;
   alpha = 3.3;
   sample_height = 0.04;
   lambda_min = 2;
   lambda_max = 2.1;
  
   [p1,m]=mcstas(model,struct('guide_length',guide_length,'nose_length',0.5:0.5:20,'m_side',m_side,'m_top',m_top,'focal_dist',focal_dist,'R0',R0,'alpha',alpha,'sample_height',sample_height, 'guide_start_width', 0.03, 'guide_start_height', 0.04, 'source_lambda_min', lambda_min, 'source_lambda_max', lambda_max, 'cold_regime',1),struct('ncount',ncount,'compile','yes'));
   [p2,m]=mcstas(model,struct('guide_length',guide_length,'nose_length',0.5:0.5:20,'m_side',m_side,'m_top',m_top,'focal_dist',focal_dist,'R0',R0,'alpha',alpha,'sample_height',sample_height, 'guide_start_width', 0.03, 'guide_start_height', 0.06, 'source_lambda_min', lambda_min, 'source_lambda_max', lambda_max, 'cold_regime',1),struct('ncount',ncount,'compile','yes'));
    [p3,m]=mcstas(model,struct('guide_length',guide_length,'nose_length',0.5:0.5:20,'m_side',m_side,'m_top',m_top,'focal_dist',focal_dist,'R0',R0,'alpha',alpha,'sample_height',sample_height, 'guide_start_width', 0.03, 'guide_start_height', 0.08, 'source_lambda_min', lambda_min, 'source_lambda_max', lambda_max, 'cold_regime',1),struct('ncount',ncount,'compile','yes'));
   [p4,m]=mcstas(model,struct('guide_length',guide_length,'nose_length',0.5:0.5:20,'m_side',m_side,'m_top',m_top,'focal_dist',focal_dist,'R0',R0,'alpha',alpha,'sample_height',sample_height, 'guide_start_width', 0.03, 'guide_start_height', 0.1, 'source_lambda_min', lambda_min, 'source_lambda_max', lambda_max, 'cold_regime',1),struct('ncount',ncount,'compile','yes'));
   [p5,m]=mcstas(model,struct('guide_length',guide_length,'nose_length',0.5:0.5:20,'m_side',m_side,'m_top',m_top,'focal_dist',focal_dist,'R0',R0,'alpha',alpha,'sample_height',sample_height, 'guide_start_width', 0.03, 'guide_start_height', 0.12, 'source_lambda_min', lambda_min, 'source_lambda_max', lambda_max, 'cold_regime',1),struct('ncount',ncount,'compile','yes'));
    [p6,m]=mcstas(model,struct('guide_length',guide_length,'nose_length',0.5:0.5:20,'m_side',m_side,'m_top',m_top,'focal_dist',focal_dist,'R0',R0,'alpha',alpha,'sample_height',sample_height, 'guide_start_width', 0.03, 'guide_start_height', 0.14, 'source_lambda_min', lambda_min, 'source_lambda_max', lambda_max, 'cold_regime',1),struct('ncount',ncount,'compile','yes'));
   [p7,m]=mcstas(model,struct('guide_length',guide_length,'nose_length',0.5:0.5:20,'m_side',m_side,'m_top',m_top,'focal_dist',focal_dist,'R0',R0,'alpha',alpha,'sample_height',sample_height, 'guide_start_width', 0.03, 'guide_start_height', 0.16, 'source_lambda_min', lambda_min, 'source_lambda_max', lambda_max, 'cold_regime',1),struct('ncount',ncount,'compile','yes'));
    [p8,m]=mcstas(model,struct('guide_length',guide_length,'nose_length',0.5:0.5:20,'m_side',m_side,'m_top',m_top,'focal_dist',focal_dist,'R0',R0,'alpha',alpha,'sample_height',sample_height, 'guide_start_width', 0.03, 'guide_start_height', 0.18, 'source_lambda_min', lambda_min, 'source_lambda_max', lambda_max, 'cold_regime',1),struct('ncount',ncount,'compile','yes'));
       [p9,m]=mcstas(model,struct('guide_length',guide_length,'nose_length',0.5:0.5:20,'m_side',m_side,'m_top',m_top,'focal_dist',focal_dist,'R0',R0,'alpha',alpha,'sample_height',sample_height, 'guide_start_width', 0.03, 'guide_start_height', 0.2, 'source_lambda_min', lambda_min, 'source_lambda_max', lambda_max, 'cold_regime',1),struct('ncount',ncount,'compile','yes'));

figure;
plot(p1.signal,'-','LineWidth',3)
hold on;
plot(p2.signal,'-','LineWidth',3)
hold on;
plot(p3.signal,'-','LineWidth',3)
hold on;
plot(p4.signal,'-','LineWidth',3)
hold on;
plot(p5.signal,'-','LineWidth',3)
hold on;
plot(p6.signal,'-','LineWidth',3)
hold on;
plot(p7.signal,'-','LineWidth',3)
hold on;
plot(p8.signal,'-','LineWidth',3)
hold on;
plot(p9.signal,'-','LineWidth',3)
title('Скан по длине носа');
legend('0.04','0.06','0.08','0.1', '0.12', '0.14', '0.16', '0.18', '0.2');
xlabel('Длина носа');
ylabel('Интенсивность');

matlabfrag('figs/nose_length_scan','epspad',[10,10,10,10]);

figure;
a(1) = max(p1.signal);
a(2) = max(p2.signal);
a(3) = max(p3.signal);
a(4) = max(p4.signal);
a(5) = max(p5.signal);
a(6) = max(p6.signal);
a(7) = max(p7.signal);
a(8) = max(p8.signal);
a(9) = max(p9.signal);
max_a = max(a);
height = [0.04,0.06,0.08,0.1,0.12,0.14,0.16,0.18,0.2];

for i=1:9
    a(i) = a(i)/max_a;
end

plot(height, a)
title('Скан по высоте');
xlabel('высота нв');
ylabel('Отн. эффективность');

matlabfrag('figs/height_scan','epspad',[10,10,10,10]);