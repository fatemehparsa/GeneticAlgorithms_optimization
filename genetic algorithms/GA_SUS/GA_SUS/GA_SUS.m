function [mating_pool] =GA_SUS(Population,N,selection_probability )
cdf(1)=selection_probability(1);
for i=2:N
    cdf(i)=cdf(i-1)+selection_probability(i);
end
q=1/N;
chose(1)=rand*q;
for(i=2:N)
    chose(i)=chose(i-1)+q;
end
for(i=1:N)
    r=chose(i);
    for(j=1:N)  
        if(r<=cdf(j))    
            mating_pool(i,:)=Population(j,:);
            break;  
        end
    end
end


