clc; clear
%%
syms r theta f(r)
gg=f^2*[1 0;
    0 r^2];
gg=sym2cell(gg);
xx=[r theta];
xx=sym2cell(xx);
gx={gg,xx};
%%
VV=sym([1 0]);   %   定义：矢量
VV=sym2cell(VV);
scalar=sym(1);   %   定义：标量
scalar=sym2cell(scalar);
divv=met2div(gx,VV)   %   矢量散度
curl=vec2curl(xx,VV)   %   矢量旋度
Lap=met2Laplace(gx,scalar)   %   标量 Laplace
conn=met2aff(gx);   %   一阶联络
affine=sym2cell(conn);   %   定义：一阶联络
tor=aff2tor(affine)   %   挠率张量
curv=aff2curv(gx,affine)   %   曲率张量
curvature=sym2cell(curv);   %   定义：曲率张量
curv_=curv2R_(gx,curvature)   %   曲率张量（下指标）
Ricci=curv2Ricci(curvature)   %   Ricci 曲率
RicciR=sym2cell(Ricci);   %   定义：Ricci 曲率
R=Ricci2R(gx,RicciR)   %   标量曲率
R=simplify(R);
Eins=curv2Eins(gx,curvature)   %   Einstein 张量

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