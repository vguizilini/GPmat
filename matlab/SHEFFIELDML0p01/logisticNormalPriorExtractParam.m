function [params, names] = logisticNormalPriorExtractParam(prior)

% LOGISTICNORMALPRIOREXTRACTPARAM Extract params from logistic-normal prior structure.
%
%	Description:
%	[params, names] = logisticNormalPriorExtractParam(prior)
%

params = [prior.mu, prior.sd];
if nargout > 1
  names = {'logistic-normal mean', 'logistic-normal std'};
end
