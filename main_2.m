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
VV=sym([1 0]);   %   ���壺ʸ��
VV=sym2cell(VV);
scalar=sym(1);   %   ���壺����
scalar=sym2cell(scalar);
divv=met2div(gx,VV)   %   ʸ��ɢ��
curl=vec2curl(xx,VV)   %   ʸ������
Lap=met2Laplace(gx,scalar)   %   ���� Laplace
conn=met2aff(gx);   %   һ������
affine=sym2cell(conn);   %   ���壺һ������
tor=aff2tor(affine)   %   ��������
curv=aff2curv(gx,affine)   %   ��������
curvature=sym2cell(curv);   %   ���壺��������
curv_=curv2R_(gx,curvature)   %   ������������ָ�꣩
Ricci=curv2Ricci(curvature)   %   Ricci ����
RicciR=sym2cell(Ricci);   %   ���壺Ricci ����
R=Ricci2R(gx,RicciR)   %   ��������
R=simplify(R);
Eins=curv2Eins(gx,curvature)   %   Einstein ����

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