function block=sr_1i_16o_c_nv(block,flag)
    if flag==1
        //Variables
        block.outptr(1)(1)=block.inptr(1)*4;
    elseif flag==0
        //variables and ODE
        //block.xd(abc)= something
    end
endfunction
