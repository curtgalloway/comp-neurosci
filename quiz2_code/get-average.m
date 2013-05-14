load('c1p8.mat')

i=0;

for index = 300:size(rho)
	if rho(index) == 1
		i=i+1;
		v(i) = mean(stim(index-300:index));
	end
end

plot(v,1:size(v));

