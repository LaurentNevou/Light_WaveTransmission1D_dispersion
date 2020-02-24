%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Polariton structure %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h=6.62606896e-34;           %% Planck constant J.s
hbar=h/(2*pi);
e=1.602176487e-19;          %% charge de l electron Coulomb
c=2.99792458e8;             %% vitesse de la lumiere m/s
Epsi0=8.854187817620e-12;   %% constant dielectric du vide F/m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nL=3;
nR=3;

lambda0=940e-9;             %% Central wavelength

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Lorenztian build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A. Gabbay, J. Reno, J. R. Wendt, A. Gin, M. C. Wanke, M. B. Sinclair, E. Shaner, and I. Brener,
% “Interaction between metamaterial resonators and intersubband transitions in semiconductor quantum wells,” 
% Appl. Phys. Lett. 98(20), 203103 (2011). 

% J. Faist, "Optical properties of semiconductor"
% chap3: "Light-matter interaction"
% 3.5.2 A polarization field

N=10e22;                    %% electron density [m-3]
z0=2e-9;                    %% dipole of the transition [meter]
DeltaE=0.010;               %% half broadening of the transition Energy [eV]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

w=2*pi*c./lambda;           %% transformation of lambda in pulsation
w0=2*pi*c/lambda0;          %% transformation of lambda in pulsation
G0=2*pi*DeltaE*e/h;         %% broadening of the transition

Cst=(N*e^2*z0^2/(Epsi0*hbar));

Lorentz1 = w0 ./ ( w0^2-w.^2 - 1i*G0*w );
%Lorentz2 = 1/2 * ( w0-w+1i*G0/2 ) ./ ( (w0-w).^2 + (G0/2)^2 );
%Lorentz3 = 1/2 * (1./(w+w0+1i*G0/2) - 1./(w-w0+1i*G0/2) );

nc=3.55;
Ki=(nc^2-1) + Cst*Lorentz1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Epsi=1+Ki;
R=real(Epsi);
I=imag(Epsi);

nn = (1/sqrt(2))*sqrt(R+sqrt(R.^2+I.^2));
kk = (1/sqrt(2))*sqrt(-R+sqrt(R.^2+I.^2));

n3=nn+1i*kk;

l3=5 * lambda0/(2*abs(mean(n3)));
alpha=2*kk.*w/c;            %% Absorbance [m-1]
Trans=exp(-alpha*l3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,1)
hold on;grid on;box on;
plot(lambda*1e9, nn ,'bo-')
xlabel('lambda (nm)')
ylabel('n')

subplot(2,2,2)
hold on;grid on;box on;
plot(lambda*1e9, kk ,'bo-')
xlabel('lambda (nm)')
ylabel('k')

subplot(2,2,3)
hold on;grid on;box on;
plot(lambda*1e9, Trans ,'bo-')
xlabel('lambda (nm)')
ylabel('Transmission')
ylim([0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n1=zeros(1,length(lambda))+3.55;   % GaAs
n2=zeros(1,length(lambda))+2.97;   % AlAs

l1=lambda0/(4*abs(mean(n1)));      % thickness at lambda/4
l2=lambda0/(4*abs(mean(n2)));      % thickness at lambda/4


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

];
