function pchar(c,a,b,t1)
% PCHAR Plots an element vector 'c' as an 'axb' grid.
%
% PCHAR(C, A, B, t1)
%
% C - An element vector of size 1x(ab).
% C's elements are plotted as an 'axb' grid.
%
% t1 - (Optional) If t1=0, 0's or -1's will not be identified by a dot.
%      If t1<>0, 0's or -1's will be identified by a dot.
%
% Example:
% >> x = [1 1 1, 0 1 0, 0 1 0, 0 1 0];
% >> pchar(x, 4, 3, 1)
%
% Author: Ahmet Rizaner
% Date: 16-10-2011, Revised on 25-11-2023
% Modified from MATLAB's 'plotchar' function

if length(c)~=a*b
    disp('Length of C is not equat to axb!.');
    return;
end

    if nargin < 4
        t1 = 0; % Default value if not provided
    end

    if(sum(c==-1)>1)
        c=sign(c+1);
    elseif (sum(c==0.9)>1)
        c=sign(c-0.1);
    end
    

% DEFINE BOX
x1 = [-0.5 -0.5 +0.5 +0.5 -0.5];
y1 = [-0.5 +0.5 +0.5 -0.5 -0.5];

% DEFINE BOX WITH X
x2 = [x1 +0.5 +0.5 -0.5];
y2 = [y1 +0.5 -0.5 +0.5];

newplot;
plot(x1*(b+0.6)+(b/2),y1*(a+0.6)+(a/2),'b');
axis([-1.5 (b+1.5) -0.5 (a+0.5)]);
axis('equal')
axis off
hold on

for i=1:length(c)
    
  x = rem(i-1,b)+.5;
  y = (a-1)-floor((i-1)/b)+.5;
  
  if (c(i)~=0)
    plot(x2*c(i)+x,y2*c(i)+y, 'b');
  elseif (t1~=0)
    plot(x2*c(i)+x,y2*c(i)+y, '.b');
  end

end
  
hold off
