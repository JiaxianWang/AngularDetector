delete(instrfindall);
s = serial('COM1');
s.baudrate = 9600;
s.terminator = 'CR';
signal = animatedline('Color','b');
fopen(s);
time = 0;
while(1)
    digital = str2num(fgetl(s));
    disp(digital);
    analog = ((digital * 3.3 / 4098) - 1.65) / 0.3;
    angle = real(asin(analog)*180/pi);
    addpoints(signal, time, angle);
    drawnow
    time = time + 1;
end
fclose(s)
delete(s)