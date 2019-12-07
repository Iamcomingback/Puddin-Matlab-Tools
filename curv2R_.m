function R_=curv2R_(gxcell,curv)
%% 输入：度规和余切基矢符号 1x2 元胞、曲率张量 ^___ 元胞；输出：曲率张量 ____ sym
g=cell2sym(gxcell{1,1}); % x=cell2sym(gxcell{1,2});
curv=cell2sym(curv);
[m,n]=size(g);
if m~=n || n==0 || m==0; error('Input metrix should be n-by-n.'); end
[m,n,p,q]=size(curv);
if m~=n || n~=p || p~=q || m==0 || n==0 || p==0 || q==0
    error('Input curvature should be n-by-n-by-n-by-n.'); end
%%
R_=sym(zeros(n,n,n,n));
for ii=1:n
  for jj=1:n
    for kk=1:n
      for ll=1:n
        for mm=1:n
          R_(ii,jj,kk,ll)=R_(ii,jj,kk,ll)...
            +g(ii,mm)*curv(mm,jj,kk,ll);
        end
      end
    end
  end
end
end