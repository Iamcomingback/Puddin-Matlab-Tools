function R=Ricci2R(gxcell,Ricci)
%% 输入：度规和余切基矢符号 1x2 元胞、Ricci 曲率 __ 元胞；输出：标量曲率 sym
g=cell2sym(gxcell{1,1}); % x=cell2sym(gxcell{1,2});
Ricci=cell2sym(Ricci);
[m,n]=size(g);
if m~=n || n==0 || m==0; error('Input metrix should be n-by-n.'); end
[m,n]=size(Ricci);
if m~=n || m==0 || n==0
    error('Input Ricci curvature should be n-by-n.'); end
%%
ig=inv(g);
R=sym(zeros(1,1));
for ii=1:n
    for jj=1:n
        R=R+ig(ii,jj)*Ricci(ii,jj);
    end
end
end