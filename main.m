close all;
clear all;

A=[ 0       , 1, 0, 0;
    16.0976 , 0, 0, 0;
    0       , 0, 0, 1;
    -0.73177, 0, 0, 0]

B=[ 0;
    -0.1463;
    0;
    0.0976]

C=[ 1, 0, 0, 0;
    0, 0, 1, 0]

D=0

E2=gerarMatrizControbilidade(A,B)

if isFullRank(E2)
    disp('Matriz é controlavel')
else
    disp('Matriz nao é controlavel')
end

T=gerarMatrizDeTransposcaoCanonicaControladora(E2,A)
[Ac,Bc,Cc]=aplicarTranformacaodeSimiliraridade(A,B,C,T)

Q=C'*C
R=1
K=lqr(A,B,Q,R)
[P,L,K]=care(A,B,Q,R)
Ac=A-B*K
closeLoop=ss(A-B*K,B,C,0);
dt=0.1;
t = 0:dt:30;  % 201 points

u = (t>0);
X0=[0;
    0;
    0;
    0];
[yOut,tOut]=lsim(closeLoop,u,t,X0);
plotGraficos(tOut, yOut)

u = (t>0);
X0 = [0.1;
      0;
      1;
      0];

[yOut,tOut]=lsim(closeLoop,u,t,X0);
plotGraficos(tOut, yOut)

t = 0:dt:90;  % 201 points
u = (t>0)-(t>45);
X0 = [0;
      0;
      0;
      0];

[yOut,tOut]=lsim(closeLoop,u,t,X0);
plotGraficos(tOut, yOut)

C=[1,0,0,0];
rank(obsv(A,C))

C=[0,0,1,0];
rank(obsv(A,C))

rootsObserver=K*4

inversaMatrizObservabilidade=[inv(obsv(A,C))]
sizeM=size(obsv(A,C))
sizeM=sizeM(1)
q=[inversaMatrizObservabilidade(:,sizeM)]

T=[q,A*q,A^2*q,A^3*q]

AObservador=inv(T)*A*T
BObservador=inv(T)*B
CObservador=C*T

polyObserver=poly(rootsObserver)
polyObserver=flip(polyObserver)
aux=size(polyObserver)
polyObserver=polyObserver(1:aux(2)-1)
polyObserver=transpose(polyObserver)
clear aux;
aux=size(obsv(A,C))
lObservador=polyObserver+AObservador(:,aux(1))

L=T*lObservador
eig(A-L*C)
ctrb(A',C')