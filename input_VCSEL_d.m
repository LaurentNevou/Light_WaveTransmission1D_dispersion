%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% VCSEL structure %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nL=3;
nR=3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% import dispersion

M      = importdata('index_data/GaAs.csv',',');
M      = M.data;
M(:,1) = M(:,1)*1e-6;
nM     = interp1(M(:,1),M(:,2),lambda);
kM     = interp1(M(:,1),M(:,3),lambda);
nkGaAs = nM + kM*1i;

M      = importdata('index_data/AlAs.csv',',');
M      = M.data;
M(:,1) = M(:,1)*1e-6;
nM     = interp1(M(:,1),M(:,2),lambda);
kM     = interp1(M(:,1),M(:,3),lambda);
nkAlAs = nM + kM*1i;

M      = importdata('index_data/Au.csv',',');
M      = M.data;
M(:,1) = M(:,1)*1e-6;
nM     = interp1(M(:,1),M(:,2),lambda);
kM     = interp1(M(:,1),M(:,3),lambda);
nkAu = nM + kM*1i;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('color','w')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,1,1)
hold on;grid on;box on;
plot(lambda*1e9, real(nkGaAs) ,'b-')
plot(lambda*1e9, real(nkAlAs) ,'g-')

title('index dispersion')
xlabel('lambda (nm)')
ylabel('real part')
legend('real-GaAs','real-AlAs')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,1,2)
hold on;grid on;box on;
plot(lambda*1e9, imag(nkGaAs),'r-')
plot(lambda*1e9, imag(nkAlAs),'m-')

xlabel('lambda (nm)')
ylabel('imaginary part')
legend('imag-GaAs','imag-AlAs')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n1=nkGaAs;
n2=nkAlAs;
lambda0=940e-9;      % Central wavelength

idx=find(abs(lambda-lambda0)==min(abs(lambda-lambda0)));      % take care that lambda0 MUST exists in the vector lambda
l1=lambda0/(4*abs(n1(idx)));   % thickness at lambda/4
l2=lambda0/(4*abs(n2(idx)));   % thickness at lambda/4
%l1=lambda0/(4*abs(mean(n1)));   % thickness at lambda/4
%l2=lambda0/(4*abs(mean(n2)));   % thickness at lambda/4

n3 = nkGaAs;
l3 = 5 * lambda0/(2*abs(mean(n3)));
%alpha3 = 4*pi*imag(n3)./lambda;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N_DBRn=15;                  %% amount of DBR n-doped pairs
N_DBRp=15;                  %% amount of DBR p-doped pairs

DBR_n=[]; DBRn=[ l1 n1 ; l2 n2 ];
DBR_p=[]; DBRp=[ l2 n2 ; l1 n1 ];

for jj=1:N_DBRn
  DBR_n = [ DBR_n ; DBRn ];
end
for jj=1:N_DBRp
  DBR_p = [ DBR_p ; DBRp ];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

layer=[ DBR_n ; l3   n3 ; DBR_p ];
%layer=[ DBR_p ; l3   n3 ; DBR_n ];

