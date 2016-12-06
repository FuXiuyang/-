function varargout = start_exe(varargin)
% START_EXE MATLAB code for start_exe.fig
%      START_EXE, by itself, creates a new START_EXE or raises the existing
%      singleton*.
%
%      H = START_EXE returns the handle to a new START_EXE or the handle to
%      the existing singleton*.
%
%      START_EXE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in START_EXE.M with the given input arguments.
%
%      START_EXE('Property','Value',...) creates a new START_EXE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before start_exe_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to start_exe_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help start_exe

% Last Modified by GUIDE v2.5 22-Dec-2015 00:27:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @start_exe_OpeningFcn, ...
                   'gui_OutputFcn',  @start_exe_OutputFcn, ...
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


% --- Executes just before start_exe is made visible.
function start_exe_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to start_exe (see VARARGIN)

% Choose default command line output for start_exe
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes start_exe wait for user response (see UIRESUME)
% uiwait(handles.figure1);
start_img;






% --- Outputs from this function are returned to the command line.
function varargout = start_exe_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.jpg;*.bmp','Image Files(*.jpg;*.bmp)';
'*.*','All Files (*.*)'},...
'ÇëÑ¡ÔñÍ¼ÏñÎÄ¼þ');
file = [pathname filename];
global img;
img = (imread(file));
axes(handles.axes_src);
imshow(img);


% --- Executes on button press in check.
function check_Callback(hObject, eventdata, handles)
% hObject    handle to check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.axes_dst);
GoodsDetection(img);
