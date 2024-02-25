%%%%%%%%%%%%g_mutation.m
function[Population]=GA_mutation(new_pop,Pm,N,L);
mask=rand(N,L)<=Pm;
Population=xor(new_pop,mask);
return;