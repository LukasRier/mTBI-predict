function cfgTrigger = initialise_trigger_port(cfgExp, cfgTrigger)
% cfgTrigger = initialise_trigger_port(cfgExp, cfgTrigger)
% initiates sending triggers to MEG pc and puts everything in cfgTrigger

cfgTrigger.handle = [];
cfgTrigger.address = [];
if cfgExp.MEGLab == 1
    if cfgExp.site == 1 
        cfgTrigger.address = hex2dec('3FF8');  % port address for Aston
    elseif cfgExp.site == 2
        cfgTrigger.address = hex2dec('BFF8');  % port address for UoB
    elseif cfgExp.site == 3
        cfgTrigger.address = hex2dec('BFF8');  % port address for UoN #TO BE CHECKED
    end
    cfgTrigger.handle = io64;
    cfgTrigger.status = io64(cfgTrigger.handle);
    io64(cfgTrigger.handle, cfgTrigger.address, 0);  % reset trigger
end

end