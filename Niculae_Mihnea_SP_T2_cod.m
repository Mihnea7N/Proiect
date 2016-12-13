clear;                             
clf;                               

N = 50; % numarul coeficientilor
D=20; % durata semnalelor
P=40;
wo = (2*pi)/P;  
duty = (D/P)*100;
c0 = 0;                            
t = -25:0.01:25;                     

figure(1)                          
%% Seria Fourier Complexa
yce = c0*ones(size(t));            
for n = -N/2:2:N/2,                    
  cn = 2/(1i*n*wo);                
  yce = yce + real(cn*exp(1i*n*wo*t)); 
end

 x2 = sawtooth(2*pi*wo*t,0.5);
plot(t,x2) 
    
hold;
plot(t,yce);			    
xlabel('t (seconds)'); ylabel('y(t)');
ttle = ['x(t)(albastru) si reconstructia folosind N = coeficienti ',...
         num2str(N)];
title(ttle);
hold;
%% Spectrul amplitudinilor Seriei Fourier Exponentiale

figure(2)                          
subplot(2,1,1)
stem(0,c0);                       
hold;
for n = -N:2:N,                    
  cn = 2/(1i*n*wo);                
  stem(n*wo,abs(cn))               
end
for n = -N+1:2:N-1,                
  cn = 0;                          
  stem(n*wo,abs(cn));              
end
xlabel('w (rad/s)')
ylabel('|cn|')
ttle = ['Spectrul Amplitudinilor ',num2str(N)];
title(ttle); 
grid;
hold;