function varargout = untitled(varargin)
% UNTITLED M-file for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 14-Dec-2015 19:18:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
global handles1;
global WSIZE;
global point_num;
global draw_x;
global draw_y;
global gx;
global gy;
global img;
global map;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
% function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% % This function has no output args, see OutputFcn.
% % hObject    handle to figure
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% % varargin   command line arguments to untitled (see VARARGIN)
% 
% % Choose default command line output for untitled
% handles.output = hObject;
% 
% % Update handles structure
% guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
% function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% % varargout  cell array for returning output args (see VARARGOUT);
% % hObject    handle to figure
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Get default command line output from handles structure
% varargout{1} = handles.output;


% --- Executes on button press in open_image.
function open_image_Callback(hObject, eventdata, handles)
% hObject    handle to open_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global handles1;
handles1 = handles;
[filename,pathname]=uigetfile({'*.jpg;*.bmp','Image Files(*.jpg;*.bmp)';
'*.*','All Files (*.*)'},...
'请选择图像文件');
file = [pathname filename];
global img;
img = (imread(file));
axes(handles.axes1);
imshow(img);
test_mouse_track(img);
global point_num;
point_num = 0;

global draw_x;
draw_x = [];
global draw_y;
draw_y = [];
global gx;
gx      = [];
global gy;
gy      = [];




% function edit1_Callback(hObject, eventdata, handles)
% % hObject    handle to edit1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of edit1 as text
% %        str2double(get(hObject,'String')) returns contents of edit1 as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function edit1_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to edit1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end



% function edit2_Callback(hObject, eventdata, handles)
% % hObject    handle to edit2 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of edit2 as text
% %        str2double(get(hObject,'String')) returns contents of edit2 as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function edit2_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to edit2 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% 
% 
% function test_mouse_track(k)
% set(gcf,'WindowButtonDownFcn',@ButttonDownFcn);
% 
%  
% 
% % 回调函数
% 
% function ButttonDownFcn(src,event)
% pt = get(gca,'CurrentPoint');
% x = pt(1,1);
% y = pt(1,2);
% 
% global point_num;
% line(x,y, 'marker', '.', 'EraseMode', 'xor');
% global draw_x;
% draw_x = [draw_x x];
% global draw_y;
% draw_y = [draw_y y];
% line(draw_x(length(draw_x)),draw_y(length(draw_y)),'Color','r', 'EraseMode', 'xor');
% 
% point_num = point_num+1;
% 
% 
% 
% global WSIZE;
% if WSIZE == 200
%     x = x/2;
%     y = y/2;
% end
% if WSIZE == 100
%     x = x/4;
%     y = y/4;
% end
% 
% x = int64(x);
% y = int64(y);
% 
% 
% global gx;
% gx      = [gx x];
% global gy;
% gy      = [gy y];
% 
% % --- Executes on mouse press over axes background.
% function axes1_ButtonDownFcn(hObject, eventdata, handles)
% % hObject    handle to axes1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% 
% % --- Executes when selected object is changed in uipanel2.
% function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% % hObject    handle to the selected object in uipanel2 
% % eventdata  structure with the following fields (see UIBUTTONGROUP)
% %	EventName: string 'SelectionChanged' (read only)
% %	OldValue: handle of the previously selected object or empty if none was selected
% %	NewValue: handle of the currently selected object
% % handles    structure with handles and user data (see GUIDATA)
% switch get(hObject,'Tag')   
%     case 'radiobutton1'
%         global WSIZE;
%         WSIZE = 400;
%     case 'radiobutton2'
%         global WSIZE;
%         WSIZE = 200;
%     case 'radiobutton3'
%         global WSIZE;
%         WSIZE = 100;
%       
% end
% 
% 
% % --- Executes during object creation, after setting all properties.
% function uipanel2_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to uipanel2 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% global WSIZE;
% WSIZE = 400;
% 
% 
% % --- Executes on button press in restoration_image.
% function restoration_image_Callback(hObject, eventdata, handles)
% % hObject    handle to restoration_image (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% % 图像修复
% global img;
% global map;
% global O;
% O = restoration(img, map);
% axes(handles.axes6);
% imshow(uint8(O));
% 
% % --- Executes on button press in check_break.
% function check_break_Callback(hObject, eventdata, handles)
% % hObject    handle to check_break (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global gx;
% global gy;
% global img;
% global map;
% grayimg = 0;
% if size(img,3) ~=0 && size(img,3) ~=1
%     grayimg = rgb2gray(img);
% else
%     grayimg = img;
% end
% grayimg = double(grayimg)./255;
% 
% map = zeros(size(grayimg));
% 
% reg_maxdist = str2double(get(handles.edit3,'String'));
% 
% l = length(gx);
% 
% for i = 1:l
%     map= map + double(regiongrowing(grayimg,double(gy(i)),double(gx(i)),reg_maxdist));
% end
% 
% map = uint8(map~=0)*255;
% axes(handles.axes4);
% imshow(map);
% 
% 
% % --- Executes on button press in save_restoration.
% function save_restoration_Callback(hObject, eventdata, handles)
% % hObject    handle to save_restoration (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% %保存结果
% global O;
% global map;
% 
% imwrite(uint8(O),'new_restored_image.jpg');
% imwrite(uint8(map),'new_mask.jpg');
% 
% function edit3_Callback(hObject, eventdata, handles)
% % hObject    handle to edit3 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of edit3 as text
% %        str2double(get(hObject,'String')) returns contents of edit3 as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function edit3_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to edit3 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% --- Executes on button press in danger_check.
function danger_check_Callback(hObject, eventdata, handles)
% hObject    handle to danger_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
% 获取图片边缘
r1=getedge(img);
% 获取去除小区域的图片
r2=getbigedge(r1,300);
% 对不同连通域进行标记
[L,num]=bwlabel(r2,8);
% 分割出不同连通域的物体图片
s=regionprops(L,'Image');

if(num<2)
%     程序终止

end
% 是否检测出危险物品的标记置0
temp=0;
axes(handles.axes4);
% 
for i=2:num
%     检测是否有与数据库相似的危险物品
    num_isdanger=isdanger(s(i).Image);
%     有与数据库相似的危险物品，直接跳出循环
    if(num_isdanger~=0)
%         是否检测出危险物品的标记置1
        temp=temp+1;
        imshow(img);
        title('检测出有危险物品');
        msgbox('可能有危险物品','提示','warn');
        break;
    end
end

% 没有检测出与数据库相似的危险物品，显示原图，由人工去检测
if(temp==0)
    imshow(img);
    title('人工检测');
end

        
