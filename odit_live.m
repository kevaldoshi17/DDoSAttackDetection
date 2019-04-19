Ng = 1e3;
Mg = 4e3;
Nte = 200;
alpha = .3;
la = log(alpha);
t_anom = 101;
Tr = 500;
dim = 15;

h = linspace(1,40,Ng);
nh = length(h);
Stop = zeros(nh,Tr);
st = zeros(nh,1);
Ind_f = false(nh,Tr);
Out = [];

%Nom1 = Nom1';
%Anom1 = Anom1';


load('nom1.mat');
load('anom1.mat');

D = zeros(Nte,Tr);
Ds = zeros(Nte+1,Tr);

Nom1 = Anoxx2;
Anom1 = Anoxx;
tic
X_N = Nom1(:,1:Ng);
X_M = Nom1(:,Ng+1:5000);

k = 1;
s = 1;
e = zeros(1,Ng);
for i=1:Ng
     dist = sqrt(sum((repmat(X_N(:,i),1,Mg)-X_M).^2));
     dist = sort(dist);
     e(i) = sum(dist(1:5));
end
e_s = sort(e);
e_t = e_s((1-alpha)*Ng);
e_s(end+1) = inf;

   
for j=1:Tr
   j
    if rem(j,1e2)==0
        fprintf('trial %d: %f\n',j,toc)
        tic
    end
   
    % Training   
   



    % Test   
    randz1 = randperm(4000,100);
    randz2 = randperm(1100,100);
    X = cat(2,Nom1(:,randz1),Anom1(:,randz2));
   
    for i=1:Nte
        dist = sqrt(sum((repmat(X(:,i),1,Mg)-X_M).^2));
        dist = sort(dist);
      
        d = sum(dist(1:5));
        D(i,j) = d - e_t;
        Ds(i+1,j) = max(Ds(i,j)+D(i,j),0);  % ODIT  

    end   
   
    for k=1:nh
        ii = find(Ds(:,j)>=h(k),1);
        if ~isnan(ii)
            Stop(k,j) = ii-1;
            Ind_f(k,j) = Stop(k,j)<t_anom;    
            if Ind_f(k,j)==0
                st(k) = st(k)+Stop(k,j);
            end
        else
            Out = [Out,j];
        end       
       
 
    end
end

Stop(:,Out) = [];
Ind_f(:,Out) = [];
tr = size(Stop,2);
P_f = sum(Ind_f,2)/tr;
Add = st./(tr-sum(Ind_f,2))-t_anom;

figure, plot(-log10(P_f),Add,'linewidth',2)



leg = legend('ODIT');
set(leg,'interpreter','latex','fontsize',13)
xlabel('$-\log_{10}P(\phi=H_1|H_0)$','interpreter','latex','fontsize',15)
ylabel('Average Detection Delay','interpreter','latex','fontsize',15)