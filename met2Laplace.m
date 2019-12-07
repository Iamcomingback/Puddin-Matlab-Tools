function Lap=met2Laplace(gxcell,f)
%% 输入：度规和余切基矢符号 1x2 元胞、标量元胞；输出：Laplace sym
g=cell2sym(gxcell{1,1}); x=cell2sym(gxcell{1,2}); f=cell2sym(f);
[m,n]=size(f);
if m~=1 && n~=1; error('Input scalar should be a scalar.'); end
[m,n]=size(g);
if m~=n || n==0 || m==0; error('Input metrix should be n-by-n.'); end
%%
dg=det(g); ig=inv(g);
Lap=0;
for ii=1:n
    for jj=1:n
        Lap=Lap+(diff((sqrt(dg)*ig(ii,jj)*diff(f,x(jj))),x(ii)))/(sqrt(dg));
    end
end
end