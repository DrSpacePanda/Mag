a=5;

fig1 = figure;
axis tight manual % this ensures that getframe() returns a consistent size

filename = 'testAnimated10_9.gif';


for i=1:100:N
   
    Xout1=Xout(:,i);
    
    %%   
    plot3(Xout1(1,:),Xout1(2,:),Xout1(3,:), '.')
    hold on
%     for nu=2:length(Xout1(1,:))
%     plot3(Xout1(1,nu),Xout1(2,nu),Xout1(3,nu), '.')
%     end
    

    xlim([-a a]);ylim([-a a]);zlim([-a a]);
%     title([num2str(h*i*R0/V0/3600),'T / [tau]'])   
    hold off
    
    drawnow 
    frame = getframe(fig1); 
      
       im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if i == 1
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 

      end
      
      
end