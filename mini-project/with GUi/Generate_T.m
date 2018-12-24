%The Function Thats Generate The Time Interval According to User
%Specification
function [ Out ] = Generate_T( Start ,End , Sample_Freq )
Out=linspace(Start,End, (End-Start)*Sample_Freq);
end

