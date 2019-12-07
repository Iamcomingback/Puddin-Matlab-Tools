function divv=met2div(gxcell,V)
%% 输入：度规和余切基矢符号 1x2 元胞、矢量 ^ 元胞；输出：散度 sym
g=cell2sym(gxcell{1,1}); x=cell2sym(gxcell{1,2}); V=cell2sym(V);
[m,n]=size(V);
if (m~=1 && n~=1) || n==0 || m==0; error('Input vector should be a vector.'); end
[m,n]=size(g);
if m~=n || n==0 || m==0; error('Input metrix should be n-by-n.'); end
%%
dg=det(g);
divv=0;
for ii=1:n
    divv=divv+(diff((sqrt(dg)*V(ii)),x(ii)))/(sqrt(dg));
end
end