function [robot_size, transformdims, corners, I0, I2, I3] = realworld()
  
  robot_size = 10;
  I0 = take_pic();
  transformdims = [260, 400];
  % use the ptransform transform
  %I4 = imfill(imclose(~im2bw(I0, graythresh(I0)), strel('disk',1)), 'holes');
  corners = getcorners(imfill(~im2bw(I0, graythresh(I0)), 'holes'), 0.8);%getcorners(I4, 0.8);
  I3 = ptransform(I0, transformdims(1), transformdims(2), corners);

  [target, start] = getendpoints(I3);
  
  % here we check to see if we are transformed
  if ((target(2) - start(2))^2 + (target(1) - start(1))^2 > 190^2)
   transformdims = [400 260];
   I3 = ptransform(I0, transformdims(1), transformdims(2), corners);
  else
   I3 = imrotate(I3, 90);
  end
  input('Place da robot, man!')
  I2 = imclose(~im2bw(I3, graythresh(I3)), strel('disk', 10));
end %  function