%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% VCSEL structure %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nL=3;
nR=3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% import dispersion

M      = importdata('index_data/GaAs.csv',',').data;
M(:,1) = M(:,1)*1e-6;
nM     = interp1(M(:,1),M(:,2),lambda);
kM     = interp1(M(:,1),M(:,3),lambda);
nkGaAs = nM + kM*1i;

M      = importdata('index_data/AlAs.csv',',').data;
M(:,1) = M(:,1)*1e-6;
nM     = interp1(M(:,1),M(:,2),lambda);
kM     = interp1(M(:,1),M(:,3),lambda);
nkAlAs = nM + kM*1i;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
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

n1=0.5*nkGaAs + 0.5*nkAlAs;
n2=nkAlAs;
lambda0=940e-9;      % Central wavelength

l1=lambda0/(4*abs(mean(n1)));   % thickness at lambda/4
l2=lambda0/(4*abs(mean(n2)));   % thickness at lambda/4

n3=nkGaAs;
l3=5 * lambda0/(2*abs(mean(n3)));
%alpha3=4*pi*imag(n3)./lambda;


layer=[

l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2

l3   n3

l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1

];
