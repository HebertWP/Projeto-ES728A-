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
Ac=A-B*K
closeLoop=ss(A-B*K,B,C,0);
dt=0.1;
t = 0:dt:30;  % 201 points

u = (t>0);
X0=[0;
    0;
    0;
    0];
[yOut,tOut]=lsim(closeLoop, u, t, X0);
plotGraficos(tOut, yOut,'Para um degral em t=0 e condiçoes inciais nulas');

u = (t>0);
X0 = [0.1;
      0;
      1;
      0];

[yOut,tOut]=lsim(closeLoop,u,t,X0);
plotGraficos(tOut, yOut,'Para um degral em t=0 e condiçoes inciais nao nulas');

t = 0:dt:90;  % 201 points
u = (t>0)-(t>45);
X0 = [0;
      0;
      0;
      0];

[yOut,tOut]=lsim(closeLoop,u,t,X0);
plotGraficos(tOut, yOut,'Para disdupio em degral e condiçoes inciais nulas')

C=[1,0,0,0];
rank(obsv(A,C))

Q=obsv(A,C)
rank(Q)
C=[0,0,1,0]
Q=gerarMatrizObservabilidadede(A,C)
rank(Q)

rootsObserver=K*4

inversaMatrizObservabilidade=[inv(Q)]
sizeM=size(obsv(A,C))
sizeM=sizeM(1)
q=[inversaMatrizObservabilidade(:,sizeM)]

T=gerarMatrizDeTransposcaoCanonicaObservavel(Q,A)
Ao=inv(T)*A*T
Bo=inv(T)*B
Co=C*T

L=acharL(rootsObserver,Q,T,Ao)
Acc=[A-B*K   , B*K;
     zeros(4), A-L*C]
N=1
Bcc=[B*N;
     zeros([4,1])]
Ccc = [Cc zeros(size(Cc))];
Dcc = [0;0];
sys_est_cl = ss(Acc,Bcc,Ccc,Dcc)

t = 0:dt:30;  % 201 points

u = (t>0);
X0 = [zeros(8,1)];
[yOut,tOut]=lsim(sys_est_cl, u, t,X0);
plotGraficos(tOut, yOut,'Para um degral em t=0 e condiçoes inciais nulas,com observador')

u = (t>0);
X0 = [0.1;
      0;
      1;
      0;
      zeros(4,1)];
[yOut,tOut]=lsim(sys_est_cl,u,t,X0);
plotGraficos(tOut, yOut,'Para um degral em t=0 e condiçoes inciais nao nulas,com observador');

t = 0:dt:90;  % 201 points
u = (t>0)-(t>45);
X0 = [zeros(8,1)];
[yOut,tOut]=lsim(sys_est_cl,u,t,X0);
plotGraficos(tOut, yOut,'Para disdupio em degral e condiçoes inciais nulas,com observador')