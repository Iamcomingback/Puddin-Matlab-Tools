function conn=met2aff(gxcell)
%% 输入：度规和余切基矢符号 1x2 元胞；输出：仿射联络 ^__ sym
g=cell2sym(gxcell{1,1}); x=cell2sym(gxcell{1,2});
[m,n]=size(g);
if m~=n || n==0 || m==0; error('Input metrix should be n-by-n.'); end
%%
ig=inv(g);
conn=sym(zeros(n,n,n));
for ii=1:n
  for jj=1:n
    for kk=1:n
      for ll=1:n
        conn(kk,ii,jj)=conn(kk,ii,jj)+ig(kk,ll)*...
          (diff(g(jj,ll),x(ii))+diff(g(ll,ii),x(jj))-diff(g(ii,jj),x(ll)));
      end
    end
  end
end
conn=conn/2;
end