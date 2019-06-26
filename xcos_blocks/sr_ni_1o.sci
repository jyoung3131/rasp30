function [x,y,typ]=sr_ni_1o(job,arg1,arg2)
    x=[];y=[];typ=[];
    select job
    case 'plot' then
        standard_draw(arg1)
    case 'getinputs' then //** GET INPUTS 
        [x,y,typ]=standard_inputs(arg1)
    case 'getoutputs' then
        [x,y,typ]=standard_outputs(arg1)
    case 'getorigin' then
        [x,y]=standard_origin(arg1)
    case 'set' then
        x=arg1;
        graphics=arg1.graphics
        model=arg1.model
        exprs=graphics.exprs
        while %t do
            [ok, in_out_num,fix_loc, exprs]=scicos_getvalue('New Block Parameter',['number of inputs';'Fix_location'],list('vec',-1,'vec',-1),exprs)
            
            if ~ok then break,end
            if ok then
                model.ipar=in_out_num
                model.rpar=[fix_loc']
                graphics.exprs=exprs;
                x.graphics=graphics;
                x.model=model
                break;
            end
        end
    case 'define' then
        in_out_num=1
        fix_loc=[0;0;0];
        model=scicos_model()
        model.sim=list('sr_ni_1o_c',5)
        model.in=[-1;-1;-1;-1;]
        model.in2=[-1;-1;-1;-1;]
        model.intyp=[-1;-1;-1;-1;]
        model.out=[-1;-1;-1;-1;]
        model.out2=[-1;-1;-1;-1;]
        model.outtyp=[-1;-1;-1;-1;]
        model.ipar=in_out_num
        //model.state=zeros(1,1)
        model.rpar= [fix_loc'];
        model.blocktype='d'
        model.dep_ut=[%f %t] //[block input has direct feedthrough to output w/o ODE   block always active]
        
        exprs=[sci2exp(in_out_num);sci2exp(fix_loc)]
        gr_i=['txt=[''sr_ni_1o''];';'xstringb(orig(1),orig(2),txt,sz(1),sz(2),''fill'');']
        x=standard_define([10 4],model, exprs,gr_i) //Numbers define the width and height of block
    end
endfunction
