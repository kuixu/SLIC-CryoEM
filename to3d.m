emd3298=importmapfile('emd_3298.voxels');
[nimage,z]=size(emd3298);
emd3d=zeros(z,z,z);
mi=min(min(emd3298));
ma=max(max(emd3298));

 %emd3d(:,i,j)=emd3298(k,:);
threshold=120;
for k=1:nimage
    i=floor((k-1)/z)+1;
    j=mod(k,z)+1;
    newpixel=floor(255*(emd3298(k,:)-mi)/(ma-mi));
    newpixel(newpixel<threshold)=0;
    %if newpixel<threshold
     %   newpixel=0;
    %end
    emd3d(:,i,j)=newpixel;
end

%i=150;
%imshow(emd3298(276*(i-1)+1:276*i,:))

%implay(emd3d)
vis3d(emd3d)