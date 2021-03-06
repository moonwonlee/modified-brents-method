% Test executor
% Written by Raehyun Kim

clear; clc;
% Set your parameters
params.func_tol=1e-14;
params.root_tol=1e-14;
params.maxit=1000;

% Fill in your SID
yourStudentID=3032247544;
fName=['modifiedbrent' int2str(yourStudentID)];

% Add your test functions
% testFun : given functions                                                         testInt : given intervals

testFun={};                                                                         testInt={};
testFun{1} =@(x) power(x, 1/2) - cos(x);                                            testInt{1}=[0.0, 1.0];
testFun{2} =@(x) 3 * (x + 1) * (x - 0.5) * (x - 1);                                 testInt{2}=[-2.0, 1.5]; % Paper typo fixed (5 ->0.5)
testFun{3} =@(x) 3 * (x + 1) * (x - 0.5) * (x - 1);                                 testInt{3}=[-1.2, 2.5]; % Paper typo fixed (5 ->0.5)
testFun{4} =@(x) power(x, 3) - 7 * power(x, 2) + 14 * x - 6;                        testInt{4}=[0.0,1.0];
testFun{5} =@(x) power(x, 3) - 7 * power(x, 2) + 14 * x - 6;                        testInt{5}=[3.2,4.0];
testFun{6} =@(x) power(x, 4) - 2 * power(x, 3) -4 * power(x, 2) + 4 * x + 4;        testInt{6}=[-2.0,-1.0];
testFun{7} =@(x) power(x, 4) - 2 * power(x, 3) -4 * power(x, 2) + 4 * x + 4;        testInt{7}=[0.0,2.0];
testFun{8} =@(x)  x - power(2,(-x));                                                testInt{8}=[0.0,1.0]; 
testFun{9} =@(x) exp(x) - x*2 + 3*x - 2;                                            testInt{9}=[0.0,1.0];
testFun{10} =@(x)  2 * x * cos(2*x) - power((x + 1),2);                                 testInt{10}=[-3.0,-2.0];
testFun{11} =@(x) 2 * x * cos(2*x) - power((x + 1),2);                                  testInt{11}=[-1.0,0.0];
testFun{12} =@(x) 3 * x - exp(x);                                                     testInt{12}=[1.0,2.0];
testFun{13} =@(x) x + 3 * cos(x) - exp(x);                                          testInt{13}=[0.0,1.0];
testFun{14} =@(x) power(x, 2) - 4*x + 4 - log(x);                                   testInt{14}=[1.0,2.0];
testFun{15} =@(x) power(x, 2) - 4*x + 4 - log(x);                                   testInt{15}=[2.0,4.0];
testFun{16} =@(x) x + 1 -2 * sin(pi * x);                                           testInt{16}=[0.0,0.5];
testFun{17} =@(x) x + 1 -2 * sin(pi * x);                                           testInt{17}=[0.5,1.0];
testFun{18} =@(x) exp(x) - 2 - cos(exp(x) - 2);                                     testInt{18}=[-1.0,2.0];
testFun{19} =@(x) (x + 2) * power((x + 1) ,2) * x * power((x - 1), 3) * (x - 2);    testInt{19}=[-0.5,2.4];
testFun{20} =@(x) (x + 2) * power((x + 1) ,2) * x * power((x - 1), 3) * (x - 2);    testInt{20}=[-0.5,3.0];
testFun{21} =@(x) (x + 2) * power((x + 1) ,2) * x * power((x - 1), 3) * (x - 2);    testInt{21}=[-3.0,-0.5];
testFun{22} =@(x) pi + 5*sin(x/2) - x;                                              testInt{22}=[0.0,6.3];  %25th example in the paer
testFun{23} =@(x) power(exp(x)/3, 1/2);                                             testInt{23}=[2.0,4.0];  %29th example in the paer, IVT test fails in the give interval.
testFun{24} =@(x) power(5,-x) - x;                                                  testInt{24}=[-2.0,5.0]; %30th example in the paer
%{ 
%original Test funcions Given By Rahyun Kim, GSI, Fall 2019, Math 128a, UC Berkeley
testFun{6}=@(x) sqrt(x)-cos(x);                                      testInt{6}=[0.0,1.0];
testFun{7}=@(x) x^3-7*x^2+14*x-6;                                    testInt{7}=[3.2,4.0];
testFun{8}=@(x) 3*x-exp(x);                                          testInt{8}=[1.0,2.0];
%}

sz=size(testFun,2);
fprintf("# \t root \t\t\t f(root) \t\t Num_Func_Call \t Num_of_Iterations \n");
for ielem=1:sz
    Int.a=testInt{ielem}(1);
    Int.b=testInt{ielem}(2);
    [root,info]=feval(fName,testFun{ielem},Int,params);
    fprintf("%d \t %f \t\t %e \t\t\t %d \t %d\n",ielem,root,testFun{ielem}(root),info.num_func_call, info.num_it);
end

