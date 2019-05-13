function testParser(fname)
    Parser = Parse_PSPICE_Out(fname);
    MOS_List = Parser.parseFile(Parser);
    for i = 1:numel(MOS_List)
        fprintf('%s\n', MOS_List(i).NAME);
        fprintf('ID:        %e\n', MOS_List(i).ID);
        fprintf('VGS:       %e\n', MOS_List(i).VGS);
        fprintf('VDS:       %e\n', MOS_List(i).VDS);
        fprintf('VBS:       %e\n', MOS_List(i).VBS);
        fprintf('VTH:       %e\n', MOS_List(i).VTH);
        fprintf('VDSAT:     %e\n', MOS_List(i).VDSAT);
        fprintf('Lin0/Sat1: %e\n', MOS_List(i).Lin0_Sat1);
        fprintf('if:        %e\n', MOS_List(i).IF);
        fprintf('ir:        %e\n', MOS_List(i).IR);
        fprintf('TAU:       %e\n', MOS_List(i).TAU);
        fprintf('GM:        %e\n', MOS_List(i).GM);
        fprintf('GDS:       %e\n', MOS_List(i).GDS);
        fprintf('GMB:       %e\n', MOS_List(i).GMB);
        fprintf('CBD:       %e\n', MOS_List(i).CBD);
        fprintf('CBS:       %e\n', MOS_List(i).CBS);
        fprintf('CGSOV:     %e\n', MOS_List(i).CGSOV);
        fprintf('CGDOV:     %e\n', MOS_List(i).CGDOV);
        fprintf('CGBOV:     %e\n', MOS_List(i).CGBOV);
        fprintf('\n');
    end
end