function G=curv2Eins(gxcell,curv)
%% 输入：度规和余切基矢符号 1x2 元胞、曲率张量 ^___ 元胞；输出：Einstein 张量 __ sym
Ricci=curv2Ricci(curv);
Riccicell=sym2cell(Ricci);
R=Ricci2R(gxcell,Riccicell);
%%
g=cell2sym(gxcell{1,1}); x=cell2sym(gxcell{1,2});
curv=cell2sym(curv);
[m,n]=size(g);
if m~=n || n==0 || m==0; error('Input metrix should be n-by-n.'); end
[m,n,p,q]=size(curv);
if m~=n || n~=p || p~=q || m==0 || n==0 || p==0 || q==0
    error('Input curvature should be n-by-n-by-n-by-n.'); end
%%
G=sym(zeros(n,n));
G=G+Ricci-R*g/2;
end