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
X0=[0;
    0;
    0;
    0];

E2=gerarMatrizControbilidade(A,B)
controlavel(E2)
T=gerarMatrizDeTransposcaoCanonicaControladora(E2,A)
[Ac,Bc,Cc]=aplicarTranformacaodeSimiliraridade(A,B,C,T)

Q=C'*C
R=1
K=lqr(A,B,Q,R)
[P,L,K]=care(A,B,Q,R)
Ac=A-B*K
closeLoop=ss(Ac,B,C,0);
dt=0.1;
t = 0:dt:30;  % 201 points
u = (t>0);

[yOut,tOut]=lsim(closeLoop,u,t,X0);
plotGraficos(tOut, yOut)