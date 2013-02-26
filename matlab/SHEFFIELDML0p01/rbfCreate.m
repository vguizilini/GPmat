function model = rbfCreate(inputDim, outputDim, options)

% RBFCREATE Wrapper for NETLAB's rbf `net'.
%
%	Description:
%	model = rbfCreate(inputDim, outputDim, options)
%

model = rbf(inputDim, options.hiddenDim, outputDim, options.activeFunc, options.outFunc);
model.numParams = model.nwts;
model.inputDim = inputDim;
model.outputDim = outputDim;
