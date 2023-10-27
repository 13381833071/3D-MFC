%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%创建局部坐标系%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ishank,jshank,kshank,originshank] = create_rhcs(RTHI1,RTHI2,RTHI3,RTHI4)
originshank = 0.5*(RTHI1+RTHI4);        %(原点在RASIS and LASIS中间)
i = RTHI1 - originshank;                %(建立骨盆x-component，单位向量)
v = originshank - 0.5 * (RTHI2+RTHI3);  %(从RPSIS and LPSIS的中点建立一个向量指向原点)
k = cross(i,v);                          %(k是垂直于包含i and v的平面的一个单位向量)
j = cross(k,i);                          %(确定最后一个unit)
ishank = i/norm(i);                       %i unit vector of pelv
jshank = j/norm(j);                       %j unit vector of pelv
kshank = k/norm(k);                       %k unit vector of pelv
end
