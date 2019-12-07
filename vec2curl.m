function curl=vec2curl(x,V)
%% ���룺���л�ʸ���� ^ Ԫ����ʸ�� ^ Ԫ������������� __ sym
x=cell2sym(x); V=cell2sym(V);
[m,n]=size(V); p=max(m,n);
if (m~=1 && n~=1) || n==0 || m==0; error('Input vector should be a vector.'); end
%%
curl=sym(zeros(n,n));
for ii=1:p
    for jj=1:p
        curl(ii,jj)=diff(V(ii),x(jj))-diff(V(jj),x(ii));
    end
end
end