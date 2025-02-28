function [cfgExp, cfgOutput] = initialise_exp_variables(cfgExp)
% [cfgExp, cfgOutput] = initialise_exp_variables(cfgExp)
% Introduces variables of interest for SpAtt task
% to change any repetition you should edit this function

rng('shuffle')
% total time: ~11 minute (5 to 7.5 sec each trial, ~3.6 min each block)
cfgExp.numBlock = 3;  % total number of blocks (3)
cfgExp.numTrial = 40;  % number of trials in each block (40)
cfgExp.numStim = cfgExp.numTrial * cfgExp.numBlock;  % number of stimuli in total
cfgExp.ITIDur =  1000 + (2000 - 1000) .* rand(cfgExp.numStim,1);  % duration of ITI in ms (jitter between 1 and 2 sec)
cfgExp.cueDur = 200;  % duration of cue presentation in ms
cfgExp.ISIDur = 1000;  % interval between cue and grating (stimulus)
cfgExp.stimDur = 1000 + (3000 - 1000) .* rand(cfgExp.numStim,1);  % duration of visual stimulus in ms (jitter between 1 and 3 sec)
cfgExp.dotDur = 100;  % duration of red dot presentation
cfgExp.corrResp = ones(cfgExp.numStim,1);  % 1=>target present 0=>catch trials
cfgExp.corrResp(2:10:end,:) = 0; 
cfgExp.corrResp = cfgExp.corrResp(randperm(length(cfgExp.corrResp)));  % randomize order of catch trials
cfgExp.respTimOut = 1500;  % time during which subject can respond in ms

cfgOutput.presd = zeros(cfgExp.numStim, 1);  % preallocate cfgOutput for unpressed trials

if strcmp(cfgExp.answer.site,'Birmingham'), cfgExp.site = 2; elseif strcmp(cfgExp.answer.site,'Nottingham'), cfgExp.site = 3;
elseif strcmp(cfgExp.answer.site,'Aston'), cfgExp.site = 1; end  % Aston -> 1, UoB -> 2, UoN ->3
if strcmp(cfgExp.answer.pc,'MEG'), cfgExp.MEGLab = 1; else, cfgExp.MEGLab = 0; end  % MEG lab computer-> 1 PC-> 0
if strcmp(cfgExp.answer.test,'task'), cfgExp.task = 1; else, cfgExp.task = 0; end  % are we collecting data and running the task?
if strcmp(cfgExp.answer.test,'train'), cfgExp.train = 1; else, cfgExp.train = 0; end  % are we training the participant?

end

% generate N random numbers in the interval (a,b): r = a + (b-a).*rand(N,1).