model = mccode('../generic_guides/generic_half_elliptic_nose.instr');
fix(model, 'all');

model.m_side = 6;
model.m_top = 6;

model.sample_dist = 0.5;
model.sample_width=0.01;
model.sample_height=0.04;

model.guide_length = 57.8;
model.guide_start_width=0.03;
model.guide_start_height=0.15;

model.source_lambda_min=2.0;
model.source_lambda_max=2.1;
model.cold_regime=1;

model.nose_length = 'free'; model.nose_length = [0.5 4.8 10];
model.loutw = 0;
model.linw = 0;
model.linh = 'free'; model.linh = [0 12.3 20];
model.louth = 'free'; model.louth = [0 0.38 5];

[parameters, fval, status, output]=fmax(model,[], ...
'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=150', nan);

a = {name {model.Parameters'; model}};