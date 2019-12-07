function Weyl=curv2Weyl(gxcell,curv)
%% 输入：度规和余切基矢符号 1x2 元胞、曲率张量 ^___ 元胞；输出：Weyl 张量 ____ sym
R_=curv2R_(gxcell,curv);
Ricci=curv2Ricci(curv);
Riccicell=sym2cell(Ricci);
R=Ricci2R(gxcell,Riccicell);
%%
g=cell2sym(gxcell{1,1}); % x=cell2sym(gxcell{1,2});
curv=cell2sym(curv);
[m,n]=size(g);
if m~=n || n==0 || m==0; error('Input metrix should be n-by-n.'); end
[m,n,p,q]=size(curv);
if m~=n || n~=p || p~=q || m==0 || n==0 || p==0 || q==0
    error('Input curvature should be n-by-n-by-n-by-n.'); end
if n<=2; error('Weyl tensor exists only in >=3 dimensions.'); end
%%
Weyl=sym(zeros(n,n,n,n));
for ii=1:n
  for jj=1:n
    for kk=1:n
      for ll=1:n
        Weyl(kk,ll,ii,jj)=Weyl(kk,ll,ii,jj)+R_(kk,ll,ii,jj)...
          -(g(kk,ii)*Ricci(jj,ll)-g(kk,jj)*Ricci(ii,ll)-...
          g(ll,ii)*Ricci(jj,kk)+g(ll,jj)*Ricci(ii,kk))/(n-2)...
          +R*(g(kk,ii)*g(jj,ll)-g(kk,jj)*g(ii,ll))/((n-1)*(n-2));
      end
    end
  end
end
end