blackBox
fileName = 'NoiseVomit';

%CHIRP: 'exp(-t)*2*sin(t^2)'

% Find handle to hidden figure
temp = get(0,'showHiddenHandles');
set(0,'showHiddenHandles','on');
hfig = gcf;
% Get the handles structure
handles = guidata(hfig);

%================Start Editing=============================================

% This will let you pick the File radio button
set(handles.radioFile, 'Value', 1);
set(handles.inputFile, 'String', 'NoiseMaker' );

% This changes the equation in the Field textbox
blackBox('input_Callback',handles.input,[],handles);


% This changes the start time
set(handles.axisStart, 'String', '0');
% This changes the end time
set(handles.axisEnd, 'String', '1000');
% This changes the step size
set(handles.stepSize, 'String', 0.002);
% This changes the refine output
set(handles.refineOutput, 'String', '1');

% Use the run button twice since the black box sucks a lot
blackBox('run_Callback',handles.run,[],handles);
blackBox('run_Callback',handles.run,[],handles);


% Change the save file name
set(handles.saveFile, 'String', fileName );
% Save
blackBox('save_Callback',handles.save,[],handles);

% % For generating sine waves at varying amplitudes instead of the chirp
% k = 10;
% name = sprintf('sin(%d*t)',k);
% set(handles.input, 'String', name );
% blackBox('input_Callback',handles.input,[],handles);

%=======================End Editing======================================
set(0,'showHiddenHandles',temp);
close(blackBox);