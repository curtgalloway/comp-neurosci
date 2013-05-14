function [ sta ] = compute_sta( stim, rho, num_timesteps )
%COMPUTE_STA Calculates the spike-triggered average for a neuron that
%            is driven by a stimulus defined in stim. The spike-
%            triggered average is computed over num_timesteps timesteps.
    sta = zeros(num_timesteps, 1);

    % This command finds the indices of all of the spikes that occur
    % after 300 ms into the recording.
    spike_times = find(rho(num_timesteps+1:end)) + num_timesteps;

    % Fill in this value. Note that you should not count spikes that occur
    % before 300 ms into the recording.
    num_spikes = 53583;
    
    % Compute the spike-triggered average of the spikes found using the
    % find command. To do this, compute the average of all of the vectors
    % starting 300 ms (exclusive) before a spike and ending at the time of
    % the event (inclusive). Each of these vectors defines a list of
    % samples that is contained within a window of 300 ms before the each
    % spike. The average of these vectors should be completed in an
    % element-wise manner.
    % 
    % Your code goes here.

    %300ms before a spike

  %  for st = 1:num_spikes
%	    sta(st) = mean(stim(spike_times(st)-num_timesteps):stim(spike_times(st)));
%	    %mean(stim(spike_times(st)-num_timesteps):stim(spike_times(st)))
%    end


     %sta = stim(spike_times(1)-num_timesteps):stim(spike_times(1));
    

     %stim(10)
     %stim(159)

     %sta = stim(spike_times(1)-num_timesteps+1) : stim(spike_times(1))  ;

     %stim(spike_times(1)-num_timesteps) : stim(spike_times(1)) 

% -----------------------------------------------
% -- My solution - cgalloway
% -----------------------------------------------
%     A = zeros(num_spikes,num_timesteps);

%     for spike = 1:num_spikes
%	for ind = 1:num_timesteps
%		A(spike,ind)=stim(spike_times(spike)-num_timesteps+ind);
%	end
%     end
     %for ind = 1:num_timesteps
%	     sta(ind) = mean(A(:,ind));
%     end
% -----------------------------------------------


%--
%- Wow - much faster
%--
%i=1;
%A = zeros(num_timesteps, num_spikes);
%
%for t = transpose(spike_times)
%    A(:,i++) = stim(t - num_timesteps + 1 : t);
%end
%
%sta = mean(A, 2);
%--


% Doesn't seem to work - but is supposedly the fastest method
% Ok - this one works. Need to modify the num_timesteps and the end

    sta = arrayfun(@(x) sum(stim(spike_times+x)), [-num_timesteps+1:0])';
    sta /= num_spikes;

% --
% Holy cow - extremely fast
% --

%    for i = 1:num_timesteps
%      sta(i) = sum(stim(spike_times + i - num_timesteps - 1));
%    endfor
%    sta /= num_spikes;

% --


%     stim(spike_times(1)-num_timesteps+1) : stim(spike_times(53583)-num_timesteps+1)) 

%     for ind = 1:num_timesteps
%	     sta(ind) = stim(spike_times(1)-num_timesteps+ind);
%     end

end

