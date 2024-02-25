%      __________________________________________________________
%      __________________________________________________________
%      |                                                        |
%      |                     Fatemeh Parsa                      |
%      |                                                        |
%      __________________________________________________________
%      __________________________________________________________



clc;
clear all;
%     ______________________Initialization_______________________
N=50;
Pc=0.9;
Pm=0.005;
Rep_Num=100;
m=5;
B_size=[4 4 4 4 4];
L=sum(B_size);
LB=[-5,-5,-5,-5,-5];
UB=[5,5,5,5,5];
Population=round(rand(N,L));
%     ___________________________________________________________
Best_So_Far=[];
Avg_fit=[];
for R=1:Rep_Num
    [Decoded_val]=GA_Decoder(Population,L,N,B_size,m,LB,UB);
    [selection_probability,fit,avg_fit,max_fit,opt_sol]=GA_fit_eval(Decoded_val,N,m) ;
if R==1
     Best_So_Far(R)=max_fit;
     final_sol=opt_sol;
 elseif max_fit>Best_So_Far(R-1);
     Best_So_Far(R)=max_fit;
     final_sol=opt_sol;
 else
     Best_So_Far(R)=Best_So_Far(R-1);
 end
 Average_fitness(R)=avg_fit;
 [mating_pool]=GA_SUS(Population,N,selection_probability);
 [new_pop]=GA_crossover(mating_pool,Pc,N,L);
 [Population]=GA_mutation(new_pop,Pm,N,L);
end
display('final Soltion   optimum fitness')
result=[final_sol,Best_So_Far(end)];
x=1:Rep_Num;
figure,plot(x,Best_So_Far,'K',x,Average_fitness,'-k');
xlabel('GENERATION');
ylabel('FITNESS FUNCTION');
legend('Best-so-far','Average fitness');

    
    
        







