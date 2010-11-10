function End = getendpoints(I)
%   GETENDPOINTS   Short description
%     [[END, START]] = GETENDPOINTS(I)
% 
%   Gets the ending points in the image
%   
%   Created by Jakub Hampl on 2010-11-10.

obj = getroundobjects(~im2bw(I), 0.5);

[w h] = size(obj);

[e, ind] = min(obj(3, :));
End = obj(1:2, ind);
obj(3, ind) = 100000;

end %  function