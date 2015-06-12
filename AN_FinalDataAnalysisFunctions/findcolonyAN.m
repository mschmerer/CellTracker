function [A,B] = findcolonyAN(dir,toshow,chan,nms,dataset,index1,thresh,nc,showcol,flag)

   
    filename{dataset} = [dir filesep  nms{dataset} '.mat'];
    load(filename{dataset},'plate1','acoords','bIms','nIms');
    disp(filename{dataset});
    colonies{dataset} = plate1.colonies;
    if ~exist('plate1','var')
        [colonies{dataset}, ~]=peaksToColonies(filename);
    end
   


col = colonies{dataset};
for ii=1:length(col)
    dat = col(ii).data(:,index1(1))./col(ii).data(:,5);
    dat2 = col(ii).ncells;
    if any(dat > thresh) %
        newdat(ii) = 1;
    else
        newdat(ii) = 0;
    end
    if any(dat2 == nc)
    newdat2(ii) = 1;
    else
        newdat2(ii) = 0;
    end
    
end

A = find(newdat);% these are the numbers of colonies to which the cells with expression above thresh belong belong
B = find(newdat2);% these are the numbers of colonies which are of sixe 'nc'
A = A';
B = B';
if isempty(A)
    disp('there are no colonies with cells above this threshold')
   return;
end

if isempty(B)
    disp('there are no colonies of this size')
   return;
end
if flag == 1
for j=1:toshow
fi = assembleColonyMM(colonies{dataset}(A(j)),dir,acoords,[2048 2048],bIms,nIms);
dat = colonies{dataset}(A(j)).data(:,index1(1))./colonies{dataset}(A(j)).data(:,5);
figure(j),subplot(1,2,1), imshow(fi{chan(1)},[]);
hold on;  plot(colonies{dataset}(A(j)).data(:,1),colonies{dataset}(A(j)).data(:,2),'r*');
title('dapi');

figure(j),subplot(1,2,2),imshow(fi{chan(2)},[]);
hold on;  plot(colonies{dataset}(A(j)).data(:,1),colonies{dataset}(A(j)).data(:,2),'r*');
text(colonies{dataset}(A(j)).data(:,1)+5,colonies{dataset}(A(j)).data(:,2),num2str(dat),'Color','r');

end
end
if flag == 0 || isempty('flag','var')
for j=1:showcol
    fi = assembleColonyMM(colonies{dataset}(B(j)),dir,acoords,[2048 2048],bIms,nIms);
    %dat = colonies{dataset}(B(j)).data(:,5);
    figure(toshow+j), imshow(fi{1},[]);
    hold on;  plot(colonies{dataset}(B(j)).data(:,1),colonies{dataset}(B(j)).data(:,2),'r*');
    title('dapi');
end
end
end