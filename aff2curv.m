function curv=aff2curv(gxcell,affine)
%% 输入：余切基矢符号 ^ 元胞、一阶联络 ^__ 元胞；输出：曲率张量 ^___ sym
aff=cell2sym(affine); x=cell2sym(gxcell{1,2});
[m,n,p]=size(aff);
if m~=n || n~=p || m==0 || n==0 || p==0
    error('Input affine connection should be n-by-n-by-n.'); end
%%
curv=sym(zeros(n,n,n,n));
for ii=1:n
  for jj=1:n
    for kk=1:n
      for ll=1:n
        curv(kk,ll,ii,jj)=curv(kk,ll,ii,jj)...
          +diff(aff(kk,jj,ll),x(ii))-diff(aff(kk,ii,ll),x(jj));
        for mm=1:n
          curv(kk,ll,ii,jj)=curv(kk,ll,ii,jj)...
            +aff(mm,jj,ll)*aff(kk,ii,mm)-aff(mm,ii,ll)*aff(kk,jj,mm);
        end
      end
    end
  end
end
end