function plotGraficos(t,y,Title)
    xCard=y(:,2);
    yCard=y(:,2)*0;
    xPen=xCard+0.5*sin(y(:,1));
    yPen=0.5*cos(y(:,1));
    
    figure('Name',Title,'NumberTitle','off');
    subplot(2,1,1);
    plot(t,y(:,1));
    title('Posicao angular');
    ylabel('rad');
    xlabel('s');
    grid on
    subplot(2,1,2); 
    plot(t,y(:,2));
    title('Posicao do carinho');
    ylabel('m');
    xlabel('s');
    grid on

    %{
    figure
    i=1;
    for t=0:0.1:30
        plot(xPen(i),yPen(i), 'o', 'MarkerSize', 10);
        hold on 
        plot(xCard(i),yCard(i), '-s', 'MarkerSize', 10);
        hold off
        xlim([-500,1])
        ylim([-0.1,0.8])
        anim(i)=getframe();
        i=i+1;
    end
%}
end