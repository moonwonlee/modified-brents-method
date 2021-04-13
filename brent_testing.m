% On input: 
%   func : is a function handle
%   Int : is the initial interval containing a root
%   params is an object that contains at least three fields 
%   params.root_tol, params.func_tol and params.maxit.
%   should terminate once the interval contain- ing the root is at most params.root_tol in length
%   or the function value at the current iterate is at most params.func_tol in absolute value.
% On output
%   root is the computed root, 
%   info should have at least one field info.flag, which is 0 for a successful execution, and 1 otherwise.
syms x;
params.maxit = 100;
params.root_tol = 1e-14;
params.func_tol = 1e-14;

fprintf("\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n");
fprintf(" ------------------1-------------------------------\n");
feu = power(x, 1/2) - cos(x);
func = matlabFunction(feu);
Int.a = 0.0;
Int.b = 1.0;
[root,info] = scratch(func,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
%fprintf("debug flag: %d\n",info.debug);
[root2, info2] = bisection(Int.a, Int.b, func, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(1)=info.it;


fprintf("--------------------2----------------------------\n");
feu = 3 * (x + 1) * (x - 5) * (x - 1);
func = matlabFunction(feu);
Int.a = -2.0;
Int.b = 1.5;
[root,info] = scratch(func,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
%fprintf("debug flag: %d\n",info.debug);
[root2, info2] = bisection(Int.a, Int.b, func, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(2)=info.it;

fprintf("---------------------3---------------------------\n");
feu = 3 * (x + 1) * (x - 5) * (x - 1);
func = matlabFunction(feu);
Int.a = -1.2;
Int.b = 2.5;
[root,info] = scratch(func,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
%fprintf("debug flag: %d\n",info.debug);
[root2, info2] = bisection(Int.a, Int.b, func, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(3)=info.it;

fprintf("---------------------4----------------------------\n");
feu2 = power(x, 3) - 7 * power(x, 2) + 14 * x - 6;
func2 = matlabFunction(feu2);
Int.a = 0.0;
Int.b = 1.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
%fprintf("debug flag: %d\n",info.debug);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(4)=info.it;


fprintf("------------------------5-------------------------\n");
feu2 = power(x, 3) - 7 * power(x, 2) + 14 * x - 6;
func2 = matlabFunction(feu2);
Int.a = 3.2;
Int.b = 4.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
%fprintf("debug flag: %d\n",info.debug);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(5)=info.it;

fprintf("------------------------6-------------------------\n");
feu2 = power(x, 4) - 2 * power(x, 3) -4 * power(x, 2) + 4 * x + 4;
func2 = matlabFunction(feu2);
Int.a = -2.0;
Int.b = -1.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(6)=info.it;

fprintf("------------------------7-------------------------\n");
feu2 = power(x, 4) - 2 * power(x, 3) -4 * power(x, 2) + 4 * x + 4;
func2 = matlabFunction(feu2);
Int.a = 0.0;
Int.b = 2.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(7)=info.it;

fprintf("------------------------8-------------------------\n");
feu2 = x - 2*(-x);
func2 = matlabFunction(feu2);
Int.a = 0.0;
Int.b = 1.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(8)=info.it;
%{
fprintf("------------------------9-------------------------\n");
feu2 = exp(x) - x*2 + 3*x - 2;
func2 = matlabFunction(feu2);
Int.a = 0.0;
Int.b = 1.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(9)=info.it;

fprintf("------------------------10-------------------------\n");
feu2 = 2*x*cos(2*x) - power((x + 1),2); 
func2 = matlabFunction(feu2);
Int.a = -3.0;
Int.b = -2.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d, info.debug: %d\n",root, info.flag, info.it, info.debug);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(10)=info.it;

fprintf("------------------------11-------------------------\n");
feu2 = 2*x*cos(2*x) - power((x + 1),2); 
func2 = matlabFunction(feu2);
Int.a = -1.0;
Int.b = 0.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(11)=info.it;

fprintf("------------------------12-------------------------\n");
feu2 = 3*x - exp(x);
func2 = matlabFunction(feu2);
Int.a = 1.0;
Int.b = 2.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(12)=info.it;

fprintf("------------------------13-------------------------\n");
feu2 = x + 3 * cos(x) - exp(x);
func2 = matlabFunction(feu2);
Int.a = 0.0;
Int.b = 1.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(13)=info.it;

fprintf("------------------------14-------------------------\n");
feu2 = power(x, 2) - 4*x + 4 - log(x);
func2 = matlabFunction(feu2);
Int.a = 1.0;
Int.b = 2.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(14)=info.it;

fprintf("------------------------15-------------------------\n");
feu2 = power(x, 2) - 4*x + 4 - log(x);
func2 = matlabFunction(feu2);
Int.a = 2.0;
Int.b = 4.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(15)=info.it;

fprintf("------------------------16-------------------------\n");
feu2 = x + 1 -2 * sin(pi * x);
func2 = matlabFunction(feu2);
Int.a = 0.0;
Int.b = 0.5;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(16)=info.it;

fprintf("------------------------17-------------------------\n");
feu2 = x + 1 -2 * sin(pi * x);
func2 = matlabFunction(feu2);
Int.a = 0.5;
Int.b = 1.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(17)=info.it;

fprintf("------------------------18-------------------------\n");
feu2 = exp(x) - 2 - cos(exp(x) - 2);
func2 = matlabFunction(feu2);
Int.a = -1.0;
Int.b = 2.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(18)=info.it;


fprintf("------------------------19-------------------------\n");
feu2 = (x + 2) * power((x + 1) ,2) * x * power((x - 1), 3) * (x - 2);
func2 = matlabFunction(feu2);
Int.a = -0.5;
Int.b = 2.4;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(19)=info.it;

fprintf("------------------------20-------------------------\n");
feu2 = (x + 2) * power((x + 1) ,2) * x * power((x - 1), 3) * (x - 2);
func2 = matlabFunction(feu2);
Int.a = -0.5;
Int.b = 3.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(20)=info.it;

fprintf("------------------------21-------------------------\n");
feu2 = (x + 2) * power((x + 1) ,2) * x * power((x - 1), 3) * (x - 2);
func2 = matlabFunction(feu2);
Int.a = -3.0;
Int.b = -0.5;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(21)=info.it;

fprintf("------------------------25-------------------------\n");
feu2 = pi + 5*sin(x/2) - x;
func2 = matlabFunction(feu2);
Int.a = 0.0;
Int.b = 6.3;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(25)=info.it;

fprintf("------------------------30-------------------------\n");
feu2 = power(5,-x) - x;
func2 = matlabFunction(feu2);
Int.a = -2.0;
Int.b = 5.0;
[root,info] = scratch(func2,Int,params);
fprintf("\nroot : %d, info.flag: %d, info.it: %d\n",root, info.flag, info.it);
[root2, info2] = bisection(Int.a, Int.b, func2, params.root_tol, params.maxit);
fprintf("root2: %d, info.it: %d\n", root2,info2.it);
a(30)=info.it;


for k = 1:30
    if ~a(k)==0
        fprintf("%d : %d\n ",k,a(k));
    end
end


 
%}
