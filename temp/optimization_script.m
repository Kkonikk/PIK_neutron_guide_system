d = '/media/konik/a09e43d5-7f1d-47d7-b0ae-2df53071d43b/JOB/PIK_neutron_guide_system/temp';
files = dir(fullfile(d, '*t.instr'));
filenames = {files.name};
for i = 1: length(filenames)
    j = 1;
    name = [];
    while strcmp(filenames{i}(j),'.') ~= 1
        name = [name, filenames{i}(j)];
        j = j + 1;
    end
    model = mccode(name);
    fix(model, 'all');
    model.m_side = 'free'; model.m_side = [1 2.5 6];
    model.m_top = 'free'; model.m_top = [1 2.5 6];
    [parameters, fval, status, output]=fmax(model,[], ...
  'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=100', nan);

    a = {name {model.Parameters'; parameters}};
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
[parameters, fval, status, output]=fmax(model,[], ...
  'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=100', nan);

%plot
model(parameters, nan);  % evaluate the best solution
figure; subplot(model.UserData.monitors)
