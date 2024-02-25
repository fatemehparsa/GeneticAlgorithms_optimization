function [ mating_pool] = GA_tornoment(Population,N,selection_probability)
for(i=1:N)
    e=round(rand*N);
    f=round(rand*N);
    if(f==0)
        f=1;
    end
    if(e==0)
        e=1;
    end
    k=selection_probability(e);
    h=selection_probability(f);
    if  (k >= h)
     mating_pool(i,:)=Population(e,:);
    else
        
       mating_pool(i,:)=Population(f,:);
    end
end
end

