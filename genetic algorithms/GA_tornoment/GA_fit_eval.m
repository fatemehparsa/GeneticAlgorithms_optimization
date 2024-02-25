%%%%%%%%%%%%%%%%%%%%%%%%%%%fit_eval.m
function[selection_probability,fit,avg_fit,max_fit,opt_sol]=GA_fit_eval(Decoded_val,N,m)
for i=1:N
   X= Decoded_val(i,:);
    fit(i)=(1-(cos(X(1)^2+X(2)^3+X(3)^(1/2)+X(4)^(1/3)+X(5)^(1/4))));
end
selection_probability=fit/sum(fit);
avg_fit=mean(fit);
[max_fit,max_loc]=max(fit);
opt_sol=Decoded_val(max_loc,:);
return;