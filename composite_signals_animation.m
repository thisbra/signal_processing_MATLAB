
Ta = 0.01;
t = 0:Ta:2;
A = 1;
fi = 3;
fii = fi/1.1;
fiii = fi/1.2;

x=0;
y=0;
z=0;

for n=1:20
    phase1 = (rand() * 2 - 1) * pi;
    phase2 = (rand() * 2 - 1) * pi;
    phase3 = (rand() * 2 - 1) * pi;
    
    xp = x;
    yp = y;
    zp = z;

    x = A * sin(2*fi*pi*t + phase1);
    y = A * sin(2*fii*pi*t + phase2);
    z = A * sin(2*fiii*pi*t + phase3);

    subplot(2,1,1);
    plot(t,x,t,y,t,z);
    legend('Fi = 3Hz', '1.1Fii = Fi', '1.2Fiii = Fi')

    for m=1:-0.05:0.001
        X = (m*xp)+((1-m)*x) + (m*yp)+((1-m)*y) + (m*zp)+((1-m)*z);

        subplot(2,1,2)
        plot(t,X,'LineWidth',2)
        legend('off')
        grid
        title('x(t)')
        ylim([-3 3])
        pause(0.01)        
    end
        pause(1.1);
end