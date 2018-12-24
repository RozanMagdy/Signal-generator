% Used To Concatinate Start , Break Points Locations and End In one Vector 
%   used for Plotting
function [ Interval ] = Generate_Interval( Start, BPL ,End )
Interval =horzcat(Start,BPL,End);
end

