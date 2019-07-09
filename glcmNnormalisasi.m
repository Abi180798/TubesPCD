clc;clear;close all;
%membaca gambar
img = [1 2 2; 4 1 3; 0 0 3];
%kondisi jika nilai matriks ada 0 semua di tambah 1
if(min(min(img)) == 0)
    img = img + 1;
end
%nilai max pada gambar
maximg = max(max(img));
%panjang dan lebar gambar(pixel)
[panjang,lebar]=size(img);
%membuat matriks kosong sejumlah 4
matrikskosong=zeros(maximg,maximg,4);   
%glcm 0 derajat
for k =1:panjang
    for l=1:lebar-1
        matriksbantu0 = img(k,l:l+1);
        matrikskosong(matriksbantu0(1,2),matriksbantu0(1,1),1)=matrikskosong(matriksbantu0(1,2),matriksbantu0(1,1),1)+1;
    end
end
matrikstranspose0 = transpose(matrikskosong(:,:,1));
hasil0 = matrikskosong(:,:,1) + matrikstranspose0;
%glcm 45 derajat
for i =1:panjang-1
    for j=1:lebar-1
        matriksbantu45 = img(i:i+1,j:j+1);
        matrikskosong(matriksbantu45(1,2),matriksbantu45(2,1),2)=matrikskosong(matriksbantu45(1,2),matriksbantu45(2,1),2)+1;
    end
end
matrikstranspose45 = transpose(matrikskosong(:,:,2));
hasil45 = matrikskosong(:,:,2) + matrikstranspose45;
%glcm 90 derajat
for i =1:panjang-1
    for j=1:lebar
        matriksbantu90 = img(i:i+1,j);
        matrikskosong(matriksbantu90(1,1),matriksbantu90(2,1),3)=matrikskosong(matriksbantu90(1,1),matriksbantu90(2,1),3)+1;
    end
end
matrikstranspose90 = transpose(matrikskosong(:,:,3));
hasil90 = matrikskosong(:,:,3) + matrikstranspose90;
%glcm 135 derajat
for i =1:panjang-1
    for j=1:lebar-1
        matriksbantu135 = img(i:i+1,j:j+1);
        matrikskosong(matriksbantu135(1,1),matriksbantu135(2,2),4)=matrikskosong(matriksbantu135(1,1),matriksbantu135(2,2),4)+1;
    end
end
matrikstranspose135 = transpose(matrikskosong(:,:,4));
hasil135 = matrikskosong(:,:,4) + matrikstranspose135;
%normalisasi
normalisasi0=hasil0/sum(sum(hasil0));
normalisasi45=hasil45/sum(sum(hasil45));
normalisasi90=hasil90/sum(sum(hasil90));
normalisasi135=hasil135/sum(sum(hasil135));