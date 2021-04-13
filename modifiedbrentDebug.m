% the replicate of modifiedbrent3032247544 for Debugging 
% The Modified Brent's Method
% Based on "A modified Brent?s method for finding zeros of functions" by Gautam Wilkins · Ming Gu
% Implemented by Moonwon Lee for Math 128A, Fall 2019
% University of California, Berkeley / Student ID : 303 224 7544

function [root,info] = modifiedbrent3032247544(func,Int,params)
% On input: 
%   func : is a function handle
%   Int : is the initial interval containing a root
%   params = an object that contains at least three fields 
%   params.root_tol : should terminate once the interval containg the root is at most params.root_tol in length
%   params.func_tol : or the function value at the current iterate is at most params.func_tol in absolute value.
%   params.maxit
% On output :
%   root = the computed root
%   info  = should have at least one field info.flag
%   info.flag = 0 is 0 for a successful execution, and 1 otherwise.
%   info.num_func_call = the number of the given function gets called.
%   info.num_it = the number of iteration.
%   info.debug is one of 0, 1, 2 and is for debugging purposes.

% Setup
a = Int.a;
b = Int.b;
%fprintf("a : %d, b : %d\n", a,b);
fa = func(a); info.num_func_call = 1;
fb = func(b); info.num_func_call = 2;
info.flag = 1;
% Optimization
if abs(fa) < abs(fb)
    [b, a] = deal(a,b);
    [fb, fa] = deal(fa,fb);
end
% The Brent's method uses bisection to guarantee convergence. 
% So it only works perfectly when f(a)f(b) <= 0. Otherwise, make an exception
if sign(fa) == sign(fb)
   fprintf('Warning!! The given function must change sign on the given interval. So ouput root would be NaN.\n');
   info.flag = 1;
   info.num_it = 0;
   root = NaN;
   return;
end
% setup
% c is b's previous value
c = a;
fc = fa;
countFive = 0;
sizeOfIntByBisec = abs(a - b); 
root = b;
fs = fb;

for k = 1: params.maxit
    if(k == params.maxit)
       info.num_it = k; 
       info.debug = 0;
       return;
    end
    fprintf("abs(b-a): %d | ",abs(b-a));
    % Divided Tol cases for debugging purposes.
    if (fs == 0)
       info.flag = 0;
       info.num_it = k; 
       info.debug = 0;
       return;
    elseif (abs(b - a) < params.root_tol) 
       info.flag = 0;
       info.num_it = k; 
       info.debug = 1;
       return;
    elseif(abs(fs) < params.func_tol)
       info.flag = 0;
       info.num_it = k; 
       info.debug = 2;
       return;
    end
    %  Inverse quadratic interpolation
    % fprintf("fa:,%d, fb:%d, fc:%d_]",fa,fb,fc);
    if fa ~= fc && fb ~= fc
        s = (a * fb * fc)/ ((fa - fb) * (fa - fc)) + (b * fa * fc)/ ((fb - fa) * (fb - fc)) + (c * fa * fb)/ ((fc - fa) * (fc - fb));
        fprintf("%dth: in IQI, s: %d ",k,s);
        set = 0;
    %  The Secant's Method
    else
        s = b - (fb * (b-a) / (fb - fa));
        fprintf("%dth: in SEQ, s: %d ",k,s);
        set = 1;
    end
    fs = func(s); info.num_func_call = info.num_func_call + 1;
    % Testing two conditions in the paper to decide whether to use Bisection Method or not.
        % Calculating new interval.
    if fa * fs < 0 
        newIntSize = abs(s - a);
    else
        newIntSize = abs(b-s);
    end
    fprintf("[ SOfIBB: %d, size: %d so %d]",sizeOfIntByBisec,newIntSize,((sizeOfIntByBisec / 2) < newIntSize));
    fprintf(" [fs: %d, fc: %d, so: %d]",abs(fs), abs(fc), abs(fs) > (abs(fc)/2));
    % The Bisection Method
        % Divided two condition cases for debugging purposes.
    % The 1st Condition
    if ((sizeOfIntByBisec / 2) < newIntSize)
        countFive = countFive + 1;
    else
        countFive = 1;
    end    
    fprintf("countFive: %d",countFive);
    % The 2nd Condition
    if countFive == 5 && ((sizeOfIntByBisec / 2) < newIntSize)
        fprintf("####in 1st_",k);
        s = (a+b) / 2;
        set = 2;
    elseif (abs(fs) > (abs(fc)/2))
        fprintf("####in 2nd_",k);
        s = (a+b) / 2;
        set = 2;
    end
    % Updating
    % Updating fs if the Bisection Method is applied.
    if set == 2
        fs = func(s); info.num_func_call = info.num_func_call + 1;
        sizeOfIntByBisec = abs(a - b); 
        countFive = 0;
    end
    % Saving/updating root with s
    root = s;
    % c is the previous b
    c = b;    
    fc = fb;
    if fa * fs < 0 
        b = s ;
        fb = fs;
    else
        a = s ;
        fa = fs;
    end
    if abs(fa) < abs(fb) 
        [b, a] = deal(a,b);
        [fb,fa]= deal(fa,fb);
    end
    fprintf(" >>root: %d, a: %d, b: %d, c: %d",s,a,b,c);
    fprintf("\n");
end

    
   