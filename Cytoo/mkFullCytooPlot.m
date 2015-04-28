function alldat=mkFullCytooPlot(matfile,printnum,returndat,mm)

if ~exist('printnum','var')
    printnum=0;
end

if ~exist('returndat','var')
    returndat=0;
end



pp=load(matfile);
col=pp.plate1.colonies;
ac=pp.acoords;

totalcells=sum([col.ncells]);
ncolumn=size(col(1).data,2);
alldat=zeros(totalcells,ncolumn);

figure; hold on;
cc=colorcube(20);
q=1;
for ii=1:length(col)
    if ~isempty(col(ii).data)
    if ~exist('mm','var') || mm ==0
        minpic=min(col(ii).data(:,end-1));
        toadd=[ac(minpic).absinds(2) ac(minpic).absinds(1)];
    else
        toadd=[ac(col(ii).imagenumbers).absinds];
        toadd=reshape(toadd,length(col(ii).imagenumbers),2);
        toadd=min(toadd,[],1);
    end
        
    dtoplot=bsxfun(@plus,col(ii).data(:,1:2),toadd);
    if returndat
        alldat(q:(q+col(ii).ncells-1),:)=[dtoplot col(ii).data(:,3:end)];
        q=q+col(ii).ncells;
    end
    %plot(dtoplot(:,2),dtoplot(:,1),'.','Color',cc(mod(ii,19)+1,:));
        plot(dtoplot(:,2),dtoplot(:,1),'.','Color','k');

    txtcolor=cc(mod(ii+10,19)+1,:);
    cen=[col(ii).center(2)+toadd(2) col(ii).center(1)+toadd(1)];
    if printnum %&& col(ii).ncells > 200
        dims = [27 18];
        [t1, t2]=ind2sub(dims,col(ii).imagenumbers(1));
        text(cen(1),cen(2),[int2str(t1) '-' int2str(t2)],'Color','m');
    end
    %disp(int2str(ii));
    end
end


