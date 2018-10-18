function [] = displayData(data)

[row,col]=size(data);

 for i=1:row
   img(:,:,:,i)= imrotate(reshape(data(i,:), 32,32,3), 270);
   
 end

  figure(1);
  montage(img);
  
end

