syms ls
syms x
a = solve(sqrt(8*0.03*x)/2+sqrt(ls^2+2*0.03*x)-ls-(25-ls)/1.15 == 0,x);
for i = 1:25
    sum(i) = double(subs(a,ls,i));
end
plot(1:25,sum)