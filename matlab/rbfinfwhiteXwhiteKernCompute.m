function K = rbfinfwhiteXwhiteKernCompute(rbfKern, whiteKern, t1, t2)

% RBFINFWHITEXWHITEKERNCOMPUTE Compute a cross kernel between the RBF-WHITE
% (with integration limits between minus infinity and infinity) and WHITE
% kernels.
% FORMAT
% DESC computes cross kernel terms between RBF-WHITE and WHITE kernels for
% the multiple output kernel. 
% ARG rbfKern : the kernel structure associated with the RBF-WHITE kernel.
% ARG whiteKern : the kernel structure associated with the WHITE kernel.
% ARG t1 : inputs for which kernel is to be computed.
% RETURN K : block of values from kernel matrix.
%
% FORMAT
% DESC computes cross kernel terms between RBF-WHITE and WHITE kernels for
% the multiple output kernel. 
% ARG rbfKern : the kernel structure associated with the RBF-WHITE kernel.
% ARG whiteKern : the kernel structure associated with the WHITE kernel.
% ARG t1 : row inputs for which kernel is to be computed.
% ARG t2 : column inputs for which kernel is to be computed.
% RETURN K : block of values from kernel matrix.
%
% SEEALSO : multiKernParamInit, multiKernCompute, rbfinfwhiteKernParamInit,
% whiteKernParamInit
%
% COPYRIGHT : David Luengo, 2009

% SHEFFIELDML


if nargin < 4
  t2 = t1;
end
if size(t1, 2) > 1 | size(t2, 2) > 1
  error('Input can only have one column');
end
if rbfKern.variance ~= whiteKern.variance
  error('Kernels cannot be cross combined if they have different variances.')
end

% Parameters required for further computations
variance = rbfKern.variance;
invWidth = rbfKern.inverseWidth;

T1 = repmat(t1, 1, size(t2, 1));
T2 = repmat(t2.', size(t1, 1), 1);
deltaT = T1-T2;

% Computation of the kernel
K = variance * sqrt(invWidth/(2*pi)) * exp(-0.5*invWidth*(deltaT.^2));
