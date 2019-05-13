classdef Parse_PSPICE_Out
    % Initialization
    properties
        filename;
    end
    methods
        % Constructor
        function obj = Parse_PSPICE_Out(f)
            obj.filename = f;
        end
    end
    methods(Static)
        % Methods
        function sorted_MOS_list = parseFile(obj)
            mos_sec = 0; % Flag for when to begin parsing lines
            MOS_list = [];
            short_MOS_list = [];
            % Read and parse file line-by-line
            fid = fopen(obj.filename);
            fline = fgetl(fid);
            while ischar(fline)
                % 
                if contains(fline, '**** MOSFETS')
                    mos_sec = 1;
                end
                % Actually process file contents when in the appropriate section.
                if mos_sec
                    if contains(fline, 'NAME ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            MOSFET = struct;
                            MOSFET.NAME         = strip(paramList(i));
                            MOSFET.ID           = 0.0;
                            MOSFET.VGS          = 0.0;
                            MOSFET.VDS          = 0.0;
                            MOSFET.VBS          = 0.0;
                            MOSFET.VTH          = 0.0;
                            MOSFET.VDSAT        = 0.0;
                            MOSFET.Lin0_Sat1    = 0.0;
                            MOSFET.IF           = 0.0;
                            MOSFET.IR           = 0.0;
                            MOSFET.TAU          = 0.0;
                            MOSFET.GM           = 0.0;
                            MOSFET.GDS          = 0.0;
                            MOSFET.GMB          = 0.0;
                            MOSFET.CBD          = 0.0;
                            MOSFET.CBS          = 0.0;
                            MOSFET.CGSOV        = 0.0;
                            MOSFET.CGDOV        = 0.0;
                            MOSFET.CGBOV        = 0.0;
                            short_MOS_list = [short_MOS_list MOSFET];
                        end
                    elseif contains(fline, 'ID ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).ID = str2double(strip(paramList(i)));
                        end
                    elseif contains(fline, 'VGS ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).VGS = str2double(strip(paramList(i)));
                        end
                    elseif contains(fline, 'VDS ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).VDS = str2double(strip(paramList(i)));
                        end
                    elseif contains(fline, 'VBS ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).VBS = str2double(strip(paramList(i)));
                        end
                    elseif contains(fline, 'VTH ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).VTH = str2double(strip(paramList(i)));
                        end
                    elseif contains(fline, 'VDSAT ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).VDSAT = str2double(strip(paramList(i)));
                        end
                    elseif contains(fline, 'Lin0/Sat1 ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).Lin0_Sat1 = str2double(strip(paramList(i)));
                        end
                    elseif contains(fline, 'if ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).IF = str2double(strip(paramList(i)));
                        end
                    elseif contains(fline, 'ir ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).IR = str2double(strip(paramList(i)));
                        end
                    end
                    if contains(fline, 'TAU ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).TAU = str2double(strip(paramList(i)));
                        end
                    end
                    if contains(fline, 'GM ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).GM = str2double(strip(paramList(i)));
                        end
                    end
                    if contains(fline, 'GDS ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).GDS = str2double(strip(paramList(i)));
                        end
                    end
                    if contains(fline, 'GMB ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).GMB = str2double(strip(paramList(i)));
                        end
                    end
                    if contains(fline, 'CBD ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).CBD = str2double(strip(paramList(i)));
                        end
                    end
                    if contains(fline, 'CBS ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).CBS = str2double(strip(paramList(i)));
                        end
                    end
                    if contains(fline, 'CGSOV ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).CGSOV = str2double(strip(paramList(i)));
                        end
                    end
                    if contains(fline, 'CGDOV ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).CGDOV = str2double(strip(paramList(i)));
                        end
                    end
                    if contains(fline, 'CGBOV ')
                        paramList = strsplit(fline);
                        for i = 2:(numel(paramList) - 1)
                            short_MOS_list(i - 1).CGBOV = str2double(strip(paramList(i)));
                        end
                    end
                    if contains(fline, 'Derivatives of gate ')
                        MOS_list = [MOS_list short_MOS_list];
                        short_MOS_list = [];
                    end
                end
                % Read the next line in the file
                fline = fgetl(fid);
            end
            fclose(fid);
            T = struct2table(MOS_list);
            sortedT = sortrows(T, 'NAME');
            sorted_MOS_list = table2struct(sortedT);
        end
    end
end