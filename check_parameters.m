% Checks the requested MOSFET parameters from a PSPICE .out file.
% Take the .out file name as a runtime parameter.
function check_parameters(fname)
    % Set Logging level
    DEBUG = 0;
    % Create Parser object and Parse file
    Parser = Parse_PSPICE_Out(fname);
    MOS_List = Parser.parseFile(Parser);
    if DEBUG
        fprintf('Number of MOSFETS: %d\n', numel(MOS_List));
    end
    % MOSFET struct has the following parameters:
    % MOSFET.NAME
    % MOSFET.ID
    % MOSFET.VGS
    % MOSFET.VDS
    % MOSFET.VBS
    % MOSFET.VTH
    % MOSFET.VDSAT
    % MOSFET.Lin0_Sat1
    % MOSFET.IF
    % MOSFET.IR
    % MOSFET.TAU
    % MOSFET.GM
    % MOSFET.GDS
    % MOSFET.GMB
    % MOSFET.CBD
    % MOSFET.CBS
    % MOSFET.CGSOV
    % MOSFET.CGDOV
    % MOSFET.CGBOV
    non_sat = [];   % List of MOSFETs that are out of saturation.
    sat_margin = 0; % Margin by which the MOSFET is out of saturation.

    % Iteratively check each MOSFET.
    for i = 1:numel(MOS_List)
        % Check saturation using the requirement VDS - VTH > 0
        saturation = abs(MOS_List(i).VDS) - abs(MOS_List(i).VDSAT);
        % If MOSFET is not saturated, add to list.
        if saturation < 0
            non_sat = [non_sat string(MOS_List(i).NAME)];
            % If MOSFET is furthest from being in saturation, save value.
            if abs(saturation) > sat_margin
                sat_margin = abs(saturation);
            end
        end
        if DEBUG
            fprintf('%s:\n', MOS_List(i).NAME);
            fprintf('Vds - Vdsat = %f\n', saturation);
        end
    end
    % Print results to user
    if numel(non_sat) > 0
        fprintf('\n%d MOSFETS out of saturation: ', numel(non_sat));
        for i = 1:numel(non_sat)
            if i == numel(non_sat)
                fprintf("%s\n", non_sat(i));
            else
                fprintf("%s, ", non_sat(i));
            end
        end
        fprintf('Saturation Margin: %e\n', sat_margin);
    else
        fprintf('\nAll MOSFETS are in saturation!\n');
    end
end
