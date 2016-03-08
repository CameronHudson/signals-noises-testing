clear all;
close all;

% Launch the GUI
blackBox

LoadFromFile = 0;
iterations = 5;
plotNoise = 0;
stepSize = 0.002;


Func1 = '(exp(-t^2)*cos(t))';
Func2 = '1';

FuncStr1 = Func1;
FuncStr2 = Func2;

%% Running the GUI
% DESCRIPTIVE TEXT

% Find handle to hidden figure
temp = get(0,'showHiddenHandles');
set(0,'showHiddenHandles','on');
hfig = gcf;
% Get the handles structure
handles = guidata(hfig);

% This will let you pick the File radio button
set(handles.radioFile, 'Value', LoadFromFile);
set(handles.inputFile, 'String', 'inputManual' );

%%Good test: (t - 10)^2 - 5

% This changes the start time
set(handles.axisStart, 'String', '0');
% This changes the end time
set(handles.axisEnd, 'String', '50');
% This changes the step size
set(handles.stepSize, 'String', num2str(stepSize));
% This changes the refine output
set(handles.refineOutput, 'String', '1');

% This changes the equation in the Field textbox
set(handles.input, 'String', Func1 );
blackBox('input_Callback',handles.input,[],handles);

rng(1);
set(handles.saveFile, 'String','Func1');
blackBox('run_Callback',handles.run,[],handles);
blackBox('run_Callback',handles.run,[],handles);
blackBox('save_Callback',handles.save,[],handles);

% This changes the equation in the Field textbox
set(handles.input, 'String', Func2 );
blackBox('input_Callback',handles.input,[],handles);

rng(1);
set(handles.saveFile, 'String','Func2');
blackBox('run_Callback',handles.run,[],handles);
blackBox('run_Callback',handles.run,[],handles);
blackBox('save_Callback',handles.save,[],handles);

sumFunc = strcat(FuncStr1,' + ',FuncStr2);

% This changes the equation in the Field textbox
set(handles.input, 'String', sumFunc);
blackBox('input_Callback',handles.input,[],handles);

rng(1);
set(handles.saveFile, 'String','Func3');
blackBox('run_Callback',handles.run,[],handles);
blackBox('run_Callback',handles.run,[],handles);
blackBox('save_Callback',handles.save,[],handles);

set(0,'showHiddenHandles',temp);
%% Filtering The Data
% DESCRIPTIVE TEXT
for n = 1:3
    fileName = strcat('Func',num2str(n));
    dataSet = load(fileName);
    signal(n,:) = dataSet.(fileName).output.signal;
end

time = dataSet.(fileName).output.time;

signal(4,:) = signal(1,:) + signal(2,:);

figure(1);
plot(time,signal(1,:),time,signal(2,:),time,signal(3,:),time,signal(4,:))



