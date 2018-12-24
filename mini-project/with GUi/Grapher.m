function varargout = Grapher(varargin)
% GRAPHER MATLAB code for Grapher.fig
%      GRAPHER, by itself, creates a new GRAPHER or raises the existing
%      singleton*.
%
%      H = GRAPHER returns the handle to a new GRAPHER or the handle to
%      the existing singleton*.
%
%      GRAPHER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAPHER.M with the given input arguments.
%
%      GRAPHER('Property','Value',...) creates a new GRAPHER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Grapher_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Grapher_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Grapher

% Last Modified by GUIDE v2.5 23-Nov-2018 10:28:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Grapher_OpeningFcn, ...
                   'gui_OutputFcn',  @Grapher_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before Grapher is made visible.
function Grapher_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = Grapher_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function Text_Par1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Text_Par2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Text_Par3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Text_BPL_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Text_BPs_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Text_Start_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Text_End_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Text_SF_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%=====================Plot Button Third Stage=======================

function Button_Plot_Callback(hObject, eventdata, handles)
%Variable Declaration
global BPs
global BPsT
global Cat_Vect
global i
global Y_Val
global Time

%GUI Modification
if BPs>=0 
    Par1=str2double(get(handles.Text_Par1,'string'));
    Par2=str2double(get(handles.Text_Par2,'string'));
    Par3=str2double(get(handles.Text_Par3,'string'));
    
    if get(handles.Radio_DC,'Value')==1
        x=1;
    elseif get(handles.Radio_Ramp,'Value')==1
        x=2; 
    elseif get(handles.Radio_Exp,'Value')==1
        x=3;
    elseif get(handles.Radio_Sin,'Value')==1
        x=4;
    else
        x=5;
    end
    %Value Of Signal For Specific Interval
    Y_Temp=Generate_Specific_Y( Cat_Vect(i),Cat_Vect(i+1),x,Par1,Par2,Par3 );
    %Value Of Signal For Main Interval
    Y_Val=horzcat(Y_Val,Y_Temp);
    i=i+1;
    BPs=BPs-1;
    set(handles.Text_Region,'String',strcat('Region:',num2str(BPsT-BPs)))
    if BPs==0 %Change button text to plot 
        set(handles.Button_Plot,'String','Plot')
    end
else
    %Last Stage Plotting Main Interval 
     plot(Time,Y_Val)
     set(handles.Button_Clear,'Visible','on')
     set(handles.Button_Plot,'Enable','Off');

end
%=====================Plot Button Third Stage=======================



%=====================Break Points Button Second Stage=======================

function Button_SetBPL_Callback(hObject, eventdata, handles)
%Variable Declaration
global BPs
global BPsT
global Cat_Vect
global Start
global End
global i

BPs=BPs-1;

%Fill Concatenation Vector with BrakPoints Location
Cat_Vect=horzcat(Cat_Vect,str2double(get(handles.Text_BPL,'String')));

%GUI Setup
set(handles.Text_BPL,'string','');
set(handles.text5,'string',strcat('Break Point:',num2str(BPsT-BPs+1))); 
if BPs==0 %Last Break Point
    %GUI Setup
   set(handles.Button_SetBPL,'String','Done')
   set(handles.Button_SetBPL,'Enable','off')
   set(handles.text5,'string',strcat('Break Point:',num2str(BPsT)))
   set(handles.Text_BPL,'Enable','Off'); 
   set(handles.uibuttongroup3,'Visible','On')
   %Final Setup For Interval Includes Start Poin Cat Vector And End 
   Cat_Vect=Generate_Interval(Start,Cat_Vect,End);
   
  %Intiaization of Variables For Next Stage
   i=1;
   BPs=BPsT;
end
%=====================Brak Points Button Second Stage=======================




%=====================Setup Button First Stage=======================

function Button_Setup_Callback(hObject, eventdata, handles)

%Variable Declaration 
global BPs
global BPsT
global Start
global End
global Cat_Vect
global Time
global Y_Val

%Variable Initialization
Cat_Vect=[];
Y_Val=[];

Time=[];

%Get Data And Generate Time
BPs=str2double(get(handles.Text_BPs,'string'));
Start=str2double(get(handles.Text_Start,'string'));
End=str2double(get(handles.Text_End,'string'));
SF=str2double(get(handles.Text_SF,'string'));
Time=Generate_T(Start,End,SF);

BPsT=BPs;

%Setup GUI For Next Step 
set(handles.Button_Setup,'Enable','Off'); 
set(handles.uibuttongroup2,'Visible','On')
set(handles.Text_Start,'Enable','off')
set(handles.Text_End,'Enable','off')
set(handles.Text_SF,'Enable','off')
set(handles.Text_BPs,'Enable','off');
%=====================Setup Button First Stage=======================



%======================Clear Button To Draw Again====================

function Button_Clear_Callback(hObject, eventdata, handles)

%====Clear Variables====
clear global BPs;
clear global BPsT;
clear global Start;
clear global End;
clear global Cat_Vect;
clear global Time;
clear global Y_Val;
clear global i;
%====Clear Variables====


%====Re-Enable Objects====
set(handles.Text_Start,'Enable','on')
set(handles.Text_End,'Enable','on')
set(handles.Text_SF,'Enable','on')
set(handles.Text_BPs,'Enable','on');
set(handles.Button_Setup,'Enable','on'); 
set(handles.Button_SetBPL,'Enable','on');
set(handles.Text_BPL,'Enable','on');
set(handles.Button_Plot,'Enable','on');
%====Re-Enable Objects====

%====Empty Texts====
set(handles.Text_Start,'string','')
set(handles.Text_End,'string','')
set(handles.Text_SF,'string','')
set(handles.Text_BPs,'string','');
set(handles.Text_Par1,'string','')
set(handles.Text_Par2,'string','')
set(handles.Text_Par3,'string','');
set(handles.Text_BPL,'string','');
set(handles.text5,'string',strcat('Break Point:1'))
%====Empty Texts====

%====Set Visibility====
set(handles.uibuttongroup3,'Visible','off')
set(handles.uibuttongroup2,'Visible','off')
set(handles.Button_Clear,'Visible','off')
%====Set Visibility====

set(handles.Button_SetBPL,'String','Next')

%========================Clear Button To Draw Again====================







    % This Sections Responsible For Setup The GUI For Accepting Multible Data On The Same Text Fields%
                    %By Changin The Visibility And The Values Of labels As Shown%
%============================================================================================================

function Radio_DC_Callback(hObject, eventdata, handles)

set(handles.Label_Par1,'string','Amplitude')
set(handles.Text_Par1,'string','')
set(handles.Text_Par1,'Visible','on')
set(handles.Label_Par1,'Visible','on')
set(handles.Text_Par2,'Visible','off')
set(handles.Label_Par2,'Visible','off')
set(handles.Text_Par3,'Visible','off')
set(handles.Label_Par3,'Visible','off');


% --- Executes on button press in Radio_Ramp.
function Radio_Ramp_Callback(hObject, eventdata, handles)

set(handles.Label_Par1,'string','Slope')
set(handles.Text_Par1,'string','')
set(handles.Label_Par2,'string','Intersect')
set(handles.Text_Par2,'string','')
set(handles.Text_Par1,'Visible','on')
set(handles.Label_Par1,'Visible','on')
set(handles.Text_Par2,'Visible','on')
set(handles.Label_Par2,'Visible','on')
set(handles.Text_Par3,'Visible','off')
set(handles.Label_Par3,'Visible','off');



% --- Executes on button press in Radio_Exp.
function Radio_Exp_Callback(hObject, eventdata, handles)
set(handles.Label_Par1,'string','Amplitude')
set(handles.Text_Par1,'string','')
set(handles.Label_Par2,'string','Exponent')
set(handles.Text_Par2,'string','')
set(handles.Text_Par1,'Visible','on')
set(handles.Label_Par1,'Visible','on')
set(handles.Text_Par2,'Visible','on')
set(handles.Label_Par2,'Visible','on')
set(handles.Text_Par3,'Visible','off')
set(handles.Label_Par3,'Visible','off');


% --- Executes on button press in Radio_Sin.
function Radio_Sin_Callback(hObject, eventdata, handles)
set(handles.Label_Par1,'string','Amplitude')
set(handles.Text_Par1,'string','')
set(handles.Label_Par2,'string','Frequency')
set(handles.Text_Par2,'string','')
set(handles.Label_Par3,'string','Phase')
set(handles.Text_Par3,'string','')
set(handles.Text_Par1,'Visible','on')
set(handles.Label_Par1,'Visible','on')
set(handles.Text_Par2,'Visible','on')
set(handles.Label_Par2,'Visible','on')
set(handles.Text_Par3,'Visible','on')
set(handles.Label_Par3,'Visible','on');

% --- Executes on button press in Radio_Imp.
function Radio_Imp_Callback(hObject, eventdata, handles)

set(handles.Label_Par1,'string','Area')
set(handles.Text_Par1,'string','')
set(handles.Text_Par1,'Visible','on')
set(handles.Label_Par1,'Visible','on')
set(handles.Text_Par2,'Visible','off')
set(handles.Label_Par2,'Visible','off')
set(handles.Text_Par3,'Visible','off')
set(handles.Label_Par3,'Visible','off');

%=======================================================================================================
                                    %End Of Radio Button Section%











function Text_Start_Callback(hObject, eventdata, handles)


function Text_End_Callback(hObject, eventdata, handles)


function Text_SF_Callback(hObject, eventdata, handles)


function Text_BPs_Callback(hObject, eventdata, handles)


function Text_BPL_Callback(hObject, eventdata, handles)


function Text_Par1_Callback(hObject, eventdata, handles)


function Text_Par2_Callback(hObject, eventdata, handles)


function Text_Par3_Callback(hObject, eventdata, handles)

