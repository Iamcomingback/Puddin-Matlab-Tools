function tor=aff2tor(affine)
%% ���룺���л�ʸ���� ^ Ԫ����һ������ ^__ Ԫ����������������� ^__ sym
aff=cell2sym(affine);
[m,n,p]=size(aff);
if m~=n || n~=p || m==0 || n==0 || p==0
    error('Input affine connection should be n-by-n-by-n.'); end
%%
tor=sym(zeros(n,n,n));
for ii=1:n
  for jj=1:n
    for kk=1:n
      tor(ii,jj,kk)=tor(ii,jj,kk)...
          +aff(ii,jj,kk)-aff(ii,kk,jj);
    end
  end
end
end