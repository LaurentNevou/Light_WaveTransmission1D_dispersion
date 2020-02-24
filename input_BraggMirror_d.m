%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% It seems like lossy DBR cannot be computed correctly with the formula.
% Therefore, results are slightly different from TMM and formula when imag(n1 or n2)~=0
%
% Have a look:
% Absorption loss influence on optical characteristics of multilayer distributed
% Bragg reflector: Wavelength-scale analysis by the method of single expression
% December 2010Opto-Electronics Review 18(4):438-445
% https://www.researchgate.net/publication/227233803_Absorption_loss_influence_on_optical_characteristics_of_multilayer_distributed_Bragg_reflector_Wavelength-scale_analysis_by_the_method_of_single_expression
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Bragg Mirror structure %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nL=1;
nR=1;

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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n1=nkGaAs;
n2=nkAlAs;
lambda0=940e-9;      % Central wavelength

l1=lambda0/(4*abs(mean(n1)));   % thickness at lambda/4
l2=lambda0/(4*abs(mean(n2)));   % thickness at lambda/4



layer=[


1*l1   n1
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
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2
l1   n1
l2   n2

];

