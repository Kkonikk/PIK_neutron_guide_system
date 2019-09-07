addpath('D:\JOB\github\PIK_neutron_guide_system\main\instruments\elliptical_noses_calculation')
%d = '/media/konik/a09e43d5-7f1d-47d7-b0ae-2df53071d43b/JOB/PIK_neutron_guide_system/temp';
d = 'D:\JOB\github\PIK_neutron_guide_system\main\instruments\elliptical_noses_calculation';
files = dir(fullfile(d, '*.instr'));
filenames = {files.name};
for i = 1: length(filenames)
    j = 1;
    name = [];
    while strcmp(filenames{i}(j),'.') ~= 1
        name = [name, filenames{i}(j)];
        j = j + 1;
    end
    model = mccode(filenames{i});
    fix(model, 'all');
    model.guide_L0_str = 'free'; model.guide_L0_str = [];
    model.guide_L1_bend = 'free'; model.guide_L1_bend = [];
    guide_L2_end = 'free'; guide_L2_end = [];
    model.loutw = 'free'; model.loutw = [];
    model.louth = 'free'; model.louth = [];
    model.linw = 'free'; model.linw = [];
    model.linh = 'free'; model.linh = [];
    [parameters, fval, status, output]=fmax(model,[], ...
  'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=100', nan);

    a = {name {model.Parameters'; model}};
%     model(parameters, nan);  % evaluate the best solution
%     figure; subplot(model.UserData.monitors)
    
%     result = iData(model, parameters, nan);	% return raw monitor as an iData object.
%     result.x
%     result.Signal
%     result.E
% 	plot(result);
% 	plot(model.UserData.monitors)
%     a(i) = [name parameters];
end



model = mccode('templateDIFF','monitor=*Theta*');	% monitor contains 'Theta'
fix(model, 'all'); 				% fix all
model.RV='free'; model.RV=[0.5 1 1.5];	% set RV free, bounds and value in a single assignment
[model, fval, status, output]=fmax(model,[], ...
  'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=100', nan);

%plot
model(model, nan);  % evaluate the best solution
figure; subplot(model.UserData.monitors)
