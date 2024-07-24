clc
clear
image=imread('final.jpg');
% image=rgb2gray(image(:;:;1));
image_r=imresize(image,[255,255]);
% r1=[215 214 213 212;208 209 210 211;204 205 206 207;203 202 201 216]
% r2=[208 213 212 205;211 202 214 215;210 216 201 209;206 204 207 203]
% r3=[245 224 223 212;208 219 220 211;224 205 216 227;213 212 221 206]
% r4=[225 204 253 212;218 239 210 211;234 215 226 217;233 222 211 226]

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

% imview(s1);
% imview(s2);
% imview(s3);
% imview(s4);


i=1;
j=1;
k=1;

for i=1:1:255
    
        for k=1:1:85
            
%             rc1=s1(i,k);
%             rc2=s2(i,k);
%             rc3=s3(i,k);
%             rc4=s4(i,k);
            
           % for j=1:1:255
                
                [m1,n1]=find(r1==s1(i,k));
                [m2,n2]=find(r2==s2(i,k));
                [m3,n3]=find(r3==s3(i,k));
                [m4,n4]=find(r4==s4(i,k));
                
                m11=dec2bin(m1,3);
                n11=dec2bin(n1,3);
                m12=dec2bin(m2,3);
                n12=dec2bin(n2,3);
                m13=dec2bin(m3,3);
                n13=dec2bin(n3,3);
                m14=dec2bin(m4,3);
                n14=dec2bin(n4,3);
                
                pixel=strcat(m11,m12,n11,n12,m13,n13,m14,n14);
                
                op1=pixel(1:8);
                op11=bin2dec(op1);
                op2=pixel(9:16);
                op12=bin2dec(op2);
                op3=pixel(17:24);
                op13=bin2dec(op3);
                for x=1:1:255
                    for y=1:1:255
                        origin(x,y)=op11;
                        y=y+1;
                        origin(x,y)=op12;
                        y=y+1;
                        origin(x,y)=op13;
                    end
                end
                        
           
                           
        end
end
origin