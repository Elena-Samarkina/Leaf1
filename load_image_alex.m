function varargout = load_image_alex(varargin)
% LOAD_IMAGE MATLAB code for load_image.fig
%      LOAD_IMAGE, by itself, creates a new LOAD_IMAGE or raises the existing
%      singleton*.
%
%      H = LOAD_IMAGE returns the handle to a new LOAD_IMAGE or the handle to
%      the existing singleton*.
%
%      LOAD_IMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOAD_IMAGE.M with the given input arguments.
%
%      LOAD_IMAGE('Property','Value',...) creates a new LOAD_IMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before load_image_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to load_image_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help load_image

% Last Modified by GUIDE v2.5 01-Dec-2015 11:37:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @load_image_OpeningFcn, ...
                   'gui_OutputFcn',  @load_image_OutputFcn, ...
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

% --- Executes just before load_image is made visible.
function load_image_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to load_image (see VARARGIN)

% Choose default command line output for load_image
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using load_image.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end

% UIWAIT makes load_image wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = load_image_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;

popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        plot(rand(5));
    case 2
        plot(sin(1:0.01:25.99));
    case 3
        bar(1:.5:10);
    case 4
        plot(membrane);
    case 5
        surf(peaks);
end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file;
file = uigetfile('*.jpg');
if ~isequal(file, 0)
    %open(file);
    global I;
    I = imread(file);
    imshow(I);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file;
file = uigetfile('*.jpg');
if ~isequal(file, 0)
    %open(file);
    global I;
    I = imread(file);
    imshow(I);
end
 imshow(I), title('original image','FontSize',16);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Работа с цветовой картой: отображение графика количества пикселей RGB цветов
%  I1 = imadjust(I,[.05 .06],[.1 .9 ],[]); желтые
%  figure, imshow(I1);
%  I1 = imadjust(I,[.07 .075],[.1 .9 ],[]);

global I;

Red = I(:,:,1);
Green = I(:,:,2);
Blue = I(:,:,3);


%Get histValues for each channel
[yRed, x] = imhist(Red);
[yGreen, x] = imhist(Green);
[yBlue, x] = imhist(Blue);
% 
 x = x(1:250);
 yRed=yRed(1:250);
 yGreen=yGreen(1:250);
 yBlue=yBlue(1:250);
%Plot them together in one plot
plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
%% Настройка для получение моноцветного изображения
%
%  Настройка для получение моноцветного изображения по умолчанию для
%  зеленых листьев, в этом окне по графику можно задать новые значения сюда
%  же можно добавить подпрограмму чтения гистограммы 


global I;
global sl1;
% display(sl1);
global I1;

I1 = imadjust(I,[.18 sl1],[.05 1 ],[]);
 imshow(I1);
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton6.


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
%% Получение серого изрбражения
 
% Получение серого изрбражения, бинарного и зашивание дыр
global I1;
global I;
I = I1;

   s = rgb2gray(I);
    I3 = imadjust(s);     

 invImg = ~im2bw(I3, 0.3);
%  subplot(2,2,2); imshow(invImg);
  I = imfill(invImg,'holes');
 imshow(I);
 

% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, ~, handles)
%% Распознавание отдельных листьев на фотографии
global I;
global L;
global background;
global flass;
global q1;
 se = strel('disk',4);
background = imopen(I,se);


L = bwconncomp(background,4);
L.NumObjects;
% отсечение слишком маленьких по площади объектов(черешков)нужен сплит для
% регулирования вместо 0.7
 rez = regionprops(L, 'Area'); 
 rez_Area = [rez.Area];
 bou_max = max(rez_Area);
sumrasp= L.NumObjects;
 
% for q=1:L.NumObjects
%     rezz=rez_Area(q);
%       
%     if  rezz<bou_max-bou_max*0.95
%       sumrasp=sumrasp-1;
%     
%     end
% %    
% end
%   figure, imshow(background), title(['Распознано ',num2str(sumrasp),'  листьев']);
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
global L;
global background;
global I;
global file;
 rez = regionprops(L, 'Area'); 
 rez_Area = [rez.Area];
 bou_max = max(rez_Area);
 q1=0;
for q=1:L.NumObjects
     rezz=rez_Area(q);
   if  rezz>bou_max-bou_max*0.95
%0,7 0,85- определяет мелкость листика тоже нужно регулировать 
grain = false(size(background));
grain(L.PixelIdxList{q}) = true;
%отображение распознаваемого листа
 figure,subplot(2,2,1);imshow(grain);

% расчет параметров линии оси листа от черешка до вершины не повернутого листа
  stats = regionprops(L, 'all');
 grain_PixelList = [stats(q).PixelList];
[min_PixelList, idx] = min(grain_PixelList);
[max_PixelList, idx1] = max(grain_PixelList);


Yonepoint = min_PixelList(2);
Ytwopoint = max_PixelList(2);
 Xonepoint = grain_PixelList(idx(2),1);
 Xtwopoint = grain_PixelList(idx1(2),1);

l = line([Xonepoint Xtwopoint],[Yonepoint Ytwopoint ],[1 1],'Marker','.','LineStyle','-');
% subplot(2,2,2), imshow(grain),imshow(l);
angle =atan((Xtwopoint- Xonepoint+1)/(Ytwopoint-Yonepoint+1));
     X = grain;
 save('X','X');
 % пересчет угла доворота от центра листа
  Y = imrotate(X, -angle*180/pi, 'loose', 'bilinear');


 subplot(2,2,3), imshow(Y),title('Повернут лист');

% фиксируем промежуточные результаты - повернутую картинку одного листа
YY = gather(Y);
f = YY;
     
% распознаем этот повернутый лист как отдельный оъект
     se1 = strel('disk',8);
 list = imopen(f,se1);
 L1 = bwconncomp(list,8);
 L1.NumObjects;
 
 stats1 = regionprops(L1, 'PixelList');
 % получение параметров  повернутого листа
  list_PixelList1 = [stats1(1).PixelList];
[min_PixelList1, idx] = min(list_PixelList1);
[max_PixelList1, idx1] = max(list_PixelList1);
Yonepoint1 = min_PixelList1(2);
Ytwopoint1 = max_PixelList1(2);
 Xonepoint1 = list_PixelList1(idx(2),1);
 Xtwopoint1 = list_PixelList1(idx1(2),1);
% получение массива хорд для левой стороны
 

 k = Yonepoint1;

 
  for k = Yonepoint1:Ytwopoint1
 
   G = f(k,:);
   sel(1)= 0;
  
    for i=1:Xonepoint1
        if  G(i)==1
           sel=sel+1;
        end
    end
   
%    disp(sel);
   left(k)=sel;
  end
% получение массива хорд для правой стороны: суммирование ненулевых
% пикселей матрицы бинарного изображения
 k = Yonepoint1;

  for k = Yonepoint1:Ytwopoint1
 
   G = f(k,:);
   sel1(1)= 0;
    for i=Xonepoint1:length(G)
        if  G(i)==1
           sel1=sel1+1;
        end
    end
   
%    disp(sel1);
  right(k)=sel1;
  end
  % Получение асимметрии одного листа за вычитом 
% макушки 5 или 10 процентов от длины листа, вклад асимметрии макушки
% большой, так как при незначительной разности в числителе
% в знаменателе меньшая сумма- кончик острый в нем меньше пикселей 
 ass(1)= 0;
 ass2(1) = 0;
 area_left(1) = 0;
 area_right(1) = 0;
 korr = 0;
 f1=(Ytwopoint1-Yonepoint1)*korr;
 f2=ceil(f1);

  for k = Yonepoint1+f2:Ytwopoint1
 ass=ass+abs(left(k)- right(k))/(left(k)+ right(k));
 ass2=ass2+(left(k)- right(k))^2/(left(k)+ right(k))^2;
%  площади левой и правой половинок и дисбаланс площадей, площаль целого
%  листа
area_left=area_left+left(k);
area_right=area_right+right(k);

  end

% area_left(q)=area_left;
%  area_right(q)=area_right;
%   получение асимметрии одного листа
% Проверка нетипичных листьев
  flass_q=ass/(Ytwopoint1-Yonepoint1-f2);
 flass_q2=ass2/(Ytwopoint1-Yonepoint1-f2);

area=area_left+area_right;

imbalance_left=area_left/area;

 if flass_q<0.55 && flass_q>0
    flass(q)=flass_q;
    flass2(q)=flass_q2;
  arealeft(q)=area_left;
arearight(q)=area_right;

title({['Асимметрия листа',num2str(flass_q),'  ',num2str(flass_q2)];['Площадь левая',num2str(area_left)];['правая',num2str(area_right)];['полная',num2str(area)]});  s1='C:\Users\Elena\Documents\MATLAB\Асим_';
s1='C:\Users\Elena\Documents\MATLAB\Асимметрия_'; 
s2=file;
 s3='.xls';
 filename = strcat(s1,s2,s3);
 
 old_dir = cd;
 cd('G');
 filename = strcat(file,'xls');
    xlswrite(filename,flass,'Параметры','E1'); 
    xlswrite(filename,flass2,'Параметры','E2'); 
    xlswrite(filename,arealeft,'Параметры','E3');
    xlswrite(filename,arearight,'Параметры','E4');
 cd(old_dir)

%  xlswrite('C:\Users\Elena\Documents\MATLAB\Асимметрия_Псков_24.xls',flass,'Серия 2','E1'); 
%   xlswrite('C:\Users\Elena\Documents\MATLAB\Асимметрия_Псков_24.xls',flass2,'Серия 2','E2'); 
%  xlswrite('C:\Users\Elena\Documents\MATLAB\Асимметрия_Псков_24.xls',arealeft,'Серия 2','E3');
%  xlswrite('C:\Users\Elena\Documents\MATLAB\Асимметрия_Псков_24.xls',arearight,'Серия 2','E4');

q1=q1+1;
   end

   end
    
   figure, imshow(I),title(['Асимметрия по всем листьям фотографии',num2str(flass1)]);
end
% xlswrite('Асимметрия.xls',flass(q),'Асиммметрия','B2');
% xlswrite('C:\Users\Elena\Documents\MATLAB\Асим.xls',flass);
% d = { 'Время', 'Temp'; 12 98; 13 99; 14 97};
% xlswrite('C:\Users\Elena\Documents\MATLAB\Асимметрия.xls',d,'Асимметрия','E1:F16');
    flass=sum(flass)/q1;
 figure, imshow(I),title(['Асимметрия ',num2str(flass)]);

    xlswrite(filename,flass,'Параметры','E5');

% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global sl1;
sl1 = get(hObject,'Value');
display(sl1);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton11.не работает
function pushbutton11_Callback(hObject, eventdata, handles)
global I;
global flass;
global q1;

%   figure, imshow(I1),title(['Асимметрия ',num2str(flass)]);
   figure, imshow(I),title(['Асимметрия ',num2str(flass)]);
%   flass=sum(flass)/q1;
%  figure, imshow(I1),
%  title(['Асимметрия ',num2str(flass1),'  листьев']);
% title(['Асимметрия',num2str(flass1)]);
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
