clc; clear all;
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
plotGraficos(tOut,yOut)

    %anim(i)=getframe;

function E=gerarMatrizControbilidade(A,B)
for i=1:size(A)
    E(:,i)=A^(i-1)*B;
end
end

function out=controlavel(E)
if rank(E)==size(E)
    out=true;
else
    out=false;
end
end

function T=gerarMatrizDeTransposcaoCanonicaControladora(E,A)
inver=inv(E);
sizeM=size(E);
sizeM=sizeM(1,1);
p=inver(sizeM,:);

for i=1:size(E)
    T(i,:)=p*A^(i-1);
end
T=inv(T);
end

function [An,Bn,Cn]=aplicarTranformacaodeSimiliraridade(A,B,C,T)
    An=inv(T)*A*T;
    Bn=inv(T)*B;
    Cn=C*T;
end

function plotGraficos(t,y)
    xCard=y(:,2);
    yCard=0;
    xPen=xCard+0.5*sin(y(:,1));
    yPen=0.5*cos(y(:,1));
    clc; clear all;
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
plotGraficos(tOut,yOut)
grid on

    %anim(i)=getframe;

function E=gerarMatrizControbilidade(A,B)
for i=1:size(A)
    E(:,i)=A^(i-1)*B;
end
end

function out=controlavel(E)
if rank(E)==size(E)
    out=true;
else
    out=false;
end
end

function T=gerarMatrizDeTransposcaoCanonicaControladora(E,A)
inver=inv(E);
sizeM=size(E);
sizeM=sizeM(1,1);
p=inver(sizeM,:);

for i=1:size(E)
    T(i,:)=p*A^(i-1);
end
T=inv(T);
end

function [An,Bn,Cn]=aplicarTranformacaodeSimiliraridade(A,B,C,T)
    An=inv(T)*A*T;
    Bn=inv(T)*B;
    Cn=C*T;
end

function plotGraficos(t,y)
    xCard=y(:,2);
    yCard=0;
    xPen=xCard+0.5*sin(y(:,1));
    yPen=0.5*cos(y(:,1));
    figure
    plot(t,y(:,1))
    figure
    plot(t,y(:,2))
    clc; clear all;
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
plotGraficos(tOut,yOut)
grid on

    %anim(i)=getframe;

function E=gerarMatrizControbilidade(A,B)
    for i=1:size(A)
        E(:,i)=A^(i-1)*B;
    end
end;

function out=controlavel(E)
    if rank(E)==size(E)
        out=true;
    else
        out=false;
    end
end;

function T=gerarMatrizDeTransposcaoCanonicaControladora(E,A)
    inver=inv(E);
    sizeM=size(E);
    sizeM=sizeM(1,1);
    p=inver(sizeM,:);

    for i=1:size(E)
        T(i,:)=p*A^(i-1);
    end
    T=inv(T);
end;

function [An,Bn,Cn]=aplicarTranformacaodeSimiliraridade(A,B,C,T)
    An=inv(T)*A*T;
    Bn=inv(T)*B;
    Cn=C*T;
end;

function plotGraficos(t,y)
    xCard=y(:,2);
    yCard=0;
    xPen=xCard+0.5*sin(y(:,1));
    yPen=0.5*cos(y(:,1));

    figure
    plot(t,y(:,1))
    figure
    plot(t,y(:,2))
    figure
    plot(xPen,yPen);
    figure    
    plot(xCard,yCard);
    %{
    i=1;
    for t=0:0.1:30
        plot(xPen(i),yPen(i));
        anim(i)=getframe();
        i=i+1;
    end
    %}
end;