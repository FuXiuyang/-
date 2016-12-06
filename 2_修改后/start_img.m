ImageFile  = 'danger\图标\开始界面.bmp';
ScreenSize = get(0,'ScreenSize');
jImage     = im2java(imread(ImageFile));
jfBounds   = num2cell([...
    (ScreenSize(3)-jImage.getWidth)/2 ...
    (ScreenSize(4)-jImage.getHeight)/2 ...
    jImage.getWidth ...
    jImage.getHeight]);
jFrame     = javax.swing.JFrame;
icon       = javax.swing.ImageIcon(jImage);
label      = javax.swing.JLabel(icon);
jFrame.getContentPane.add(label);
jFrame.setUndecorated(true);
jFrame.setBounds(jfBounds{:});
jFrame.pack;
jFrame.show;
pause(3);
jFrame.dispose;