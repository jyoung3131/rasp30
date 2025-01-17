function [x,y,typ]=sr_16i_1o_nv(job,arg1,arg2)
    // Copyright INRIA
    x=[];y=[];typ=[];
    select job
    case 'plot' then
        standard_draw(arg1)
    case 'getinputs' then
        [x,y,typ]=standard_inputs(arg1)
    case 'getoutputs' then
        [x,y,typ]=standard_outputs(arg1)
    case 'getorigin' then
        [x,y]=standard_origin(arg1)
    case 'set' then
        x=arg1;
        graphics=arg1.graphics;exprs=graphics.exprs
        model=arg1.model;
        while %t do
            [ok,in_out_num,nob,exprs]=getvalue('Set shift register 16 input 1 output Parameters',['Number of sr 16in 1out blocks';'Number of bits(leave other inputs unconnected except for clk,CS and D)'],list('vec',1,'vec',-1),exprs)

            if ~ok then break,end

            if ok then
                model.in=[in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num]
                model.out=[in_out_num;in_out_num;in_out_num;in_out_num]
                model.ipar=in_out_num;
                model.rpar = nob;
                graphics.exprs=exprs;
                x.graphics=graphics;x.model=model
                break
            end
        end
    case 'define' then
        nob=16;
        in_out_num =1;
        model=scicos_model()
        //model.sim=list('c4_func',5)
        model.in=[in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num;in_out_num]
        model.in2=[1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1]
        model.intyp=[-1;-1;-1;-1;-1;-1;-1;-1;-1;-1;-1;-1;-1;-1;-1;-1;-1;-1;-1]
        model.out=[in_out_num;in_out_num;in_out_num;in_out_num]
        model.out2=[1;1;1;1]
        model.outtyp=[-1;-1;-1;-1]
        model.rpar = nob
        model.ipar=in_out_num
        model.blocktype='d'
        model.dep_ut=[%f %t]

        exprs=[sci2exp(in_out_num);sci2exp(nob)]
        gr_i=['txt=''sr_16i_1o_nv '';';'xstringb(orig(1),orig(2),txt,sz(1),sz(2),''fill'')']
        x=standard_define([10 16],model,exprs,gr_i)
    end
endfunction
