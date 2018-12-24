start=input('enter start point');
NBP=input('enter break points number');
BPL=input('enter matrix of break points');
End=input('enter end point');
Sample_Freq=input('enter sampling freq');

Interval =horzcat(start,BPL,End);
for i=1:NBP+1

Specific_T=linspace(Interval(i),Interval(i+1), (Interval(i+1)-Interval(i))*Sample_Freq);

Type= input('enter singal type ');
Par1=input('enter singal parmter one');
Par2=input('enter singal two ');
Par3=input('enter singal three');
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