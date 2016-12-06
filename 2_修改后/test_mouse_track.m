function test_mouse_track(k)

figure();
axis([0,400,-400,0]);
imshow(k)
set(gcf,'WindowButtonDownFcn',@ButttonDownFcn);

 

% »Øµ÷º¯Êý

function ButttonDownFcn(src,event)
pt = get(gca,'CurrentPoint');
x = pt(1,1);
y = pt(1,2);
fprintf('x=%f,y=%f\n',x,y);
