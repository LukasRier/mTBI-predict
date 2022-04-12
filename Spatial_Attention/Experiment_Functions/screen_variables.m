function cfgScreen = screen_variables(cfgExp)
% cfgScreen = screen_variables(cfgExp)
% introduce primary settings of screen

PsychDefaultSetup(2);
cfgScreen.scrNum = max(Screen('Screens'));  % get screen number - draw to the external screen if avaliable
cfgScreen.resolution = Screen('Resolution', cfgScreen.scrNum);  % get/set the on screen resolution

% if cfgExp.MEGLab
%     cfgScreen.distance = 100;  % set the distance from participant to the projector
%     cfgScreen.dispSize.width = 81.5;  % physical width of screen in cm
%     cfgScreen.dispSize.height = 46;  % physical height of screen in cm
% else
    [cfgScreen.dispSize.width, cfgScreen.dispSize.height]...
        = Screen('DisplaySize', cfgScreen.scrNum);  % get the physical size of the screen in millimeters
    cfgScreen.distance = 60;  % set the distance from participant to the projector
% end
cfgScreen.black = BlackIndex(cfgScreen.scrNum);
cfgScreen.white = WhiteIndex(cfgScreen.scrNum);
cfgScreen.grey = cfgScreen.white/2;
cfgScreen.fntSize = 50;
cfgScreen.stimRotSpeed = 3; % number of 360-degree rotations per second
cfgScreen.destRectBigH = 7;  % height of big destination rectangle for stimulus in visual degrees
cfgScreen.destRectBigW = 7;  % width of big destination rectangle for stimulus in visual degrees
cfgScreen.destRectSmallH = cfgScreen.destRectBigH - 0.25;  % height of small destination rectangle for stimulus in visual degrees
cfgScreen.destRectSmallW = cfgScreen.destRectBigW - 0.25;  % width of small destination rectangle for stimulus in visual degrees
cfgScreen.destRectCueSize = 3;  % size of destination rectangle for cue
cfgScreen.visStimToR = [5, 1, 5, 1];  % how many visual degrees from centre is stim presented (right)
cfgScreen.visStimToL = [5, -1, 5, -1];  % how many visual degrees from centre is stim presented (left)
cfgScreen.cueToB = [0, 2, 0, 2];  % how many visual degrees from centre is cue presented (below)
cfgScreen.backProjection = 0;  % is a backprojection screen used? (1 = yes, 0 = no),

if cfgExp.task || cfgExp.train
        cfgScreen.fullScrn = [0, 0, cfgScreen.resolution.width, cfgScreen.resolution.height];  % full screen for task/ train
else
        cfgScreen.fullScrn = [300, 300, 900, 900];  % use a smaller screen during testing
end

