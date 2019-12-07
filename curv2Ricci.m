function Ricci=curv2Ricci(curv)
%% ���룺�������� ^___ Ԫ���������Ricci ���� __ sym
curv=cell2sym(curv);
[m,n,p,q]=size(curv);
if m~=n || n~=p || p~=q || m==0 || n==0 || p==0 || q==0
    error('Input curvature should be n-by-n-by-n-by-n.'); end
%%
Ricci=sym(zeros(n,n));
for ii=1:n
    for jj=1:n
        for kk=1:n
            Ricci(ii,jj)=Ricci(ii,jj)+curv(kk,ii,kk,jj);
        end
    end
end
end