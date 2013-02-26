function l = uniformPriorLogProb(prior, x)

% UNIFORMPRIORLOGPROB Log probability of uniform prior.

% SHEFFIELDML

% Compute log prior

l = sum(log((x >= prior.a) .* (x <= prior.b) * 1 / (prior.b - prior.a)));
