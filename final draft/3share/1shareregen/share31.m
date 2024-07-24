clc
clear
image=imread('cam.jpg');
image_r=imresize(image,[255,255]);
% r1=[215 214 213 212 208 209 210 211;204 205 206 207 203 202 201 216;228 223 112 105 111 102 114 115;220 226 221 109 106 104 7 3;58 183 192 255 244 22 24 25;150 160 101 129 56 4 7 223;222 233 155 188 199 21 54 5;250 251 192 77 156 234 141 131];
%r2=[]
r1=mod(uint16(rand(8)*1000),256);
r2=mod(uint16(rand(8)*1000),256);
r3=mod(uint16(rand(8)*1000),256);
r4=mod(uint16(rand(8)*1000),256);

r1=uint8(r1)
r2=uint8(r2)
r3=uint8(r3)
r4=uint8(r4)



for i=1:1:255
    j=1;
    for k=1:1:85
        while j<256
            p1=image_r(i,j);
            j=j+1;
            p2=image_r(i,j);
            j=j+1;
            p3=image_r(i,j);

            bin1=dec2bin(p1,8);
            bin2=dec2bin(p2,8);
            bin3=dec2bin(p3,8);
            b=strcat(bin1,bin2,bin3);
            b;
            b1=b(1:3);
            b2=b(4:6);
            b3=b(7:9);
            b4=b(10:12);
            b5=b(13:15);
            b6=b(16:18);
            b7=b(19:21);
            b8=b(22:24);

            d1=bin2dec(b1)+1;
            d2=bin2dec(b2)+1;
            d3=bin2dec(b3)+1;
            d4=bin2dec(b4)+1;
            d5=bin2dec(b5)+1;
            d6=bin2dec(b6)+1;
            d7=bin2dec(b7)+1;
            d8=bin2dec(b8)+1;

            s1(i,k)=r1(d1,d3);
            s2(i,k)=r2(d2,d4);
            s3(i,k)=r3(d5,d7);
            s4(i,k)=r4(d6,d8);

            k=k+1;
            j=j+1;
        end
    end
end
s1=uint8(s1);
s2=uint8(s2);
s3=uint8(s3);
s4=uint8(s4);

imview(s1);
imview(s2);
imview(s3);
imview(s4);


i=1;
j=1;
k=1;

for i=1:1:255
    
    j=1;
    
        for k=1:1:85
            
%             rc1=s1(i,k);
%             rc2=s2(i,k);
%             rc3=s3(i,k);
%             rc4=s4(i,k);
            
                            
%                 [m1,n1]=find(r1==s1(i,k),1);
%                 [m2,n2]=find(r2==s2(i,k),1);
%                 [m3,n3]=find(r3==s3(i,k),1);
                [m4,n4]=find(r4==s4(i,k),1);
                
%                 m1=m1-1;
%                 n1=n1-1;
%                 m2=m2-1;
%                 n2=n2-1;
%                 m3=m3-1;
%                 n3=n3-1;
                m4=m4-1;
                n4=n4-1;
                

                
%                 m11=dec2bin(m1,3);
%                 n11=dec2bin(n1,3);
%                 m12=dec2bin(m2,3);
%                 n12=dec2bin(n2,3);
%                 m13=dec2bin(m3,3);
%                 n13=dec2bin(n3,3);
%                 m14=dec2bin(m4,3);
%                 n14=dec2bin(n4,3);
               
%                 m11=dec2bin(m1,6);
%                 n11=dec2bin(n1,6);
%                 m12=dec2bin(m2,6);
%                 n12=dec2bin(n2,6);
%                 m13=dec2bin(m3,6);
%                 n13=dec2bin(n3,6);
                m14=dec2bin(m4,12);
                n14=dec2bin(n4,12);

                
%                 m13=dec2bin(m3,4);
%                 n13=dec2bin(n3,4);
                pixel=strcat(m14,n14);
%                 pixel=strcat(m11,m12,n11,n12,m13,n13,m14,n14);
                
                op1=pixel(1:8);
                op11=bin2dec(op1);
                op2=pixel(9:16);
                op12=bin2dec(op2);
                op3=pixel(17:24);
                op13=bin2dec(op3);
                
                       
                
                origin(i,j)=uint8(op11);
                j=j+1;
                origin(i,j)=uint8(op12);
                j=j+1;
                origin(i,j)=uint8(op13);
                j=j+1;                                      
            
                           
        end
end
imview(origin);
