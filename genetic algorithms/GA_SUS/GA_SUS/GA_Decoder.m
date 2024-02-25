
%%%%%%%%%%%%GA_Decoder
function[Decoded_val]=GA_Decoder(Population,L,N,B_size,m,LB,UB)
Decoded_val=[];
STED(1)=1;
for i=2:m+1
    STED(i)=STED(i-1)+B_size(i-1);
end
for j=1:m
    x=B_size(j)-1:-1:0;
    Pow2x=2.^x;
    for i=1:N
        gene=Population(i,STED(j):STED(j+1)-1);
        Var_norm=sum(Pow2x.*gene)/(2^B_size(j)-1);
        Decoded_val(i,j)=LB(j)+(UB(j)-LB(j))*Var_norm;
    end
end
return;
    
    
