function Ret = corrupt(Inx,per)
    
    I_SIZE=length(Inx);
	N_COR=floor(I_SIZE*per/100);

    I_INX=randperm(I_SIZE);
    C_INX=I_INX(1:N_COR);
    if sum(Inx==0)>0 %if binary input (0,1)
        Inx(C_INX)=(-1*Inx(C_INX))+1;
    else %if bipolar input (-1,1)
        Inx(C_INX)=-1*Inx(C_INX);
    end
    Ret=Inx;
end
