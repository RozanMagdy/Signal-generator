function [ Specific_Y ] = Generate_Specific_Y( Lim1,Lim2,Type,Par1,Par2,Par3 )
%====Declaration and initialization of variables==== 
global Time
Specific_T=[];
%====Declaration and initialization of variables==== 



%Select Specific T out of Main Time Interval According To Break point
%                              Location
for s=1:numel(Time) 

    if Time(s)>=Lim1 && Time(s)<=Lim2
        Specific_T=horzcat(Specific_T,Time(s));
    end
end
if Specific_T(1,end)==Lim2 && Specific_T(1,end)~=Specific_T(1,end)
    Specific_T(1,end)=[];
end
%Select Specific T out of Main Time Interval According To Break point
%                              Location



%====Select The Signal To Calculate & Plot====
switch Type
    case 1 %DC Signal Par1-> Amplitude
        Specific_Y=Par1*ones(1,numel(Specific_T));
        plot(Specific_T,Specific_Y)

    case 2 %Ramp Signal Par1->Slope, Par2->Intersect
        Specific_Y=Par1*(Specific_T)+Par2;
        plot(Specific_T,Specific_Y)

    case 3 %Exponential Signal Par1-> Amplitude , Par2->Exponent
        Specific_Y=Par1*exp(Specific_T*Par2);
        plot(Specific_T,Specific_Y)

    case 4 %Sinusoidal Signal Par1->Amplitude , PAr2->Frequency in Hz , Par3->Phase Shift In rad
        Specific_Y=Par1*sin(2* pi *Specific_T * Par2 + Par3);
        plot(Specific_T,Specific_Y)
    case 5 %Impulse Signal Par1-> Area
        Specific_Y=Par1./abs(Lim2-Lim1).*ones(1,numel(Specific_T));
        plot(Specific_T,Specific_Y)

end


end
%====Select The Signal To Calculate & Plot====
