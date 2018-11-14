model = mccode('../generic_guides/generic_half_elliptic_nose.instr');
fix(model, 'all');

model.m_side = 6;
model.m_top = 6;

model.sample_dist = 0.5;
model.sample_width=0.01;
model.sample_height=0.01;

model.guide_length = 107;
model.guide_start_width=0.05;
model.guide_start_height=0.14;

model.source_lambda_min=5.0;
model.source_lambda_max=5.1;
model.cold_regime=1;

model.nose_length = 'free'; model.nose_length = [0.5 4.8 20];
model.loutw = 'free'; model.loutw = [0 0.38 5];
model.linw = 'free'; model.linw = [0 12.3 20];
model.linh = 0;
model.louth = 0;

[parameters, fval, status, output]=fmax(model,[], ...
'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=100', nan);

a = {name {model.Parameters'; model}};