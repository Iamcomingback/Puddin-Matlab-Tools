clc; clear
%%
syms u v phi
gg=[u^2+v^2 0 0;
    0 u^2+v^2 0;
    0 0 u^2*v^2];
gg=sym2cell(gg);
xx=[u v phi];
xx=sym2cell(xx);
gx={gg,xx};
%%
% syms t theta phi
% gg=sym([0 0 t;
%         0 1 0;
%         t 0 sin(theta)^2]);
% gg=sym2cell(gg);
% xx=[t theta phi];
% xx=sym2cell(xx);
% gx={gg,xx};
%%
syms a b c d f
VV=[a b c d];
VV=sym2cell(VV);
f=sym2cell(f);
divv=met2div(gx,VV);
Lap=met2Laplace(gx,f);
conn=met2aff(gx);
affine=sym2cell(conn);
curv=aff2curv(gx,affine);
curvature=sym2cell(curv);
Weyl=curv2Weyl(gx,curvature)
%%
[n,~,~]=size(conn); con_nz=[];
for ii=1:n
    for jj=1:n
        for kk=1:n
            if conn(ii,jj,kk)~=0
                con_nz=[con_nz;[ii jj kk conn(ii,jj,kk)]];
            end
        end
    end
end
% con_nz