clc
clear
image_r=imread('final.jpg');
%image_r=rgb2gray(image);
%r1=[215 214 213 212;208 209 210 211;204 205 206 207;203 202 201 216]
%r2=[208 213 212 205;211 202 214 215;210 216 201 209;206 204 207 203]

r1=mod(uint16(rand(4)*1000),256);
r2=mod(uint16(rand(4)*1000),256);
r1=uint8(r1)
r2=uint8(r2)
for i=1:1:256
    for j=1:1:256
    p=image_r(i,j);
    b=dec2bin(p,8);
    b1=b(1:2);
    b2=b(3:4);
    b3=b(5:6);
    b4=b(7:8);
    d1=bin2dec(b1)+1;
    d2=bin2dec(b2)+1;
    d3=bin2dec(b3)+1;
    d4=bin2dec(b4)+1;
    
    s1(i,j)=r1(d1,d3);
    s2(i,j)=r2(d2,d4);
    
    end
end
s1=uint8(s1);
s2=uint8(s2);
imview(s1);
    imview(s2);
    
i=1;
j=1;
k=1;

for i=1:1:256
    
    j=1;
    
        for k=1:1:256
            
%             rc1=s1(i,k);
%             rc2=s2(i,k);
%             rc3=s3(i,k);
%             rc4=s4(i,k);
            
                            
                [m1,n1]=find(r1==s1(i,k),1);
%                 [m2,n2]=find(r2==s2(i,k),1);
                
                m1=m1-1;
                n1=n1-1;
%                 m2=m2-1;
%                 n2=n2-1;
                
                m11=dec2bin(m1,4);
                n11=dec2bin(n1,4);
%                 m12=dec2bin(m2,2);
%                 n12=dec2bin(n2,2);
                
                
%                 pixel=strcat(m11,m12,n11,n12);
                pixel=strcat(m11,n11);
                op1=pixel(1:8);
                op11=bin2dec(op1);
                
                       
                
                origin(i,j)=uint8(op11);
                j=j+1;                           
        end
end
imview(origin);