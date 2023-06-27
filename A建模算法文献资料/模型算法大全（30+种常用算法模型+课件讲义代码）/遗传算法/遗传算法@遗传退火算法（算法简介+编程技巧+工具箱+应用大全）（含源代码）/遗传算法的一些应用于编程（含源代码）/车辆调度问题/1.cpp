#include<stdio.h>
#include<math.h>
#include<stdlib.h>
int main()
{
	float min(float,float);
	int i,j,s[9][9]={0},n=8,L[9]={0},Q=8,Ln=0,M[4]={0},jb=0,ib=0,a=0,b=0,N[5]={0},x=0,y=0;
	float t[9][9]={0},DERTAa1,DERTAa2,DERTAb1,DERTAb2,k[9],EF[100],qq=0,q[8]={0};

float g[9]={0,2,1.5,4.5,3,1.5,4,2.5,3};
float T[9]={0,1,2,1,3,2,2.5,3,0.8};
float ET[9]={0,1,4,1,4,3,2,5,1.5};
float LT[9]={0,4,6,2,7,5.5,5,8,4};
int d[9][9]={0,40,60,75,90,200,100,160,80,40,
             0,65,40,100,50,75,110,100,60,65,
             0,75,100,100,75,75,75,75,40,75,
             0,100,50,90,90,150,90,100,100,100,
             0,100,75,75,100,200,50,100,50,100,
             0,70,90,75,100,75,75,90,75,70,
             0,70,100,160,110,75,90,75,90,70,
             0,100,80,100,75,150,100,75,100,100,0};

printf("各任务的货运量g[i]如下：\n");


for (i=1;i<=n;i++)
{printf("g%d=%-5.1f",i,g[i]);
}
printf("\n\n\n");


printf("各任务的装货（或卸货）时间T[i]为：\n");
for (i=1;i<=n;i++)
{printf("T%d=%-5.1f",i,T[i]);
}
printf("\n\n\n");


printf("各任务的开始执行的时间范围[ETi,LTi]为：\n");
for (i=1;i<=n;i++)
{printf("[ET%d,LT%d]=[%-3.1f,%-3.1f]\n",i,i,ET[i],LT[i]);
}
printf("\n\n\n");

 
printf("车场0与各任务点间的距离d[i][j]为：\n");   
	for(i=0;i<=8;i++)
		{for(j=0;j<=8;j++)
	{printf("%5d",d[i][j]);}
	printf("\n");
	}

printf("\n\n");


printf("点对之间连接的费用节约值s[i][j]为：\n");

for(i=1;i<=8;i++)
{for(j=i+1;j<=8;j++)
{ s[i][j]=d[i][0]+d[0][j]-d[i][j];
   
}
}
	for(i=1;i<=8;i++)
		{for(j=i+1;j<=8;j++)
	{printf("s[%d][%d]=%-5d",i,j,s[i][j]);}
	printf("\n");
	}


printf("\n");



for(i=0;i<=8;i++)
{for(j=0;j<=8;j++){t[i][j]=(float)d[i][j]/50;}}

for(i=0;i<=8;i++)
{if ((t[0][i]>=ET[i])&&(t[0][i]<=LT[i]))
{k[i]=t[0][i];}
if (t[0][i]<ET[i])
{k[i]=ET[i];}}







while (1)
{ ib=0;jb=0;
	for(i=1;i<=8;i++)
{   for(j=i+1;j<=8;j++)
{if (s[i][j]>s[a][b])    {a=i;b=j;}} 
}

if (s[a][b]==0) break;
N[1]=0;N[2]=M[1];N[3]=M[1]+M[2];N[4]=M[1]+M[2]+M[3];
for(i=0;i<8;i++)
{if (L[i]==a) {ib=1;x=i;}}
 
for(j=0;j<8;j++)
{if (L[j]==b) {jb=1;y=j;}}

if (ib==0&&jb==0)
{qq=g[a]+g[b];if (qq>Q) {s[a][b]=0;continue;}
EF[b]=k[a]+T[a]+t[a][b]-k[b];
EF[a]=k[b]+T[b]+t[a][b]-k[a];
DERTAb1=LT[b]-k[b];
DERTAb2=k[b]-ET[b];
DERTAa1=LT[a]-k[a];
DERTAa2=k[a]-ET[a];


if (((EF[b]>=0)&&(DERTAb1>=EF[b]))||((EF[b]<0)&&(DERTAb2>=(0-EF[b]))))
{L[N[4]]=a;
L[N[4]+1]=b;
Ln=Ln+1;
q[Ln]=qq;
k[b]=k[b]+EF[b];
s[a][b]=0;
M[Ln]=M[Ln]+2;
continue;}

else if ((EF[a]>=0&&DERTAa1>=EF[a])||(EF[a]<0&&(DERTAa2>=(0-EF[a]))))
{L[N[4]]=b;
L[N[4]+1]=a;
Ln=Ln+1;
q[Ln]=qq;
k[a]=k[a]+EF[a];
s[a][b]=0;
M[Ln]=M[Ln]+2;
continue;}


}


if (ib==0&&jb==1)
{i=a;a=b;b=i;x=y;ib=1;jb=0;}

if (ib==1&&jb==0)
{if (x==N[1]||x==N[2]||x==N[3])
{i=a;a=b;b=i;}

for(i=1;i<=3;i++)
{if (x==N[i])
{qq=q[i]+g[a];
if (qq>Q) {s[a][b]=0;s[b][a]=0;continue;}
EF[b]=k[a]+T[a]+t[a][b]-k[b];


if (EF[b]>0) 
{DERTAb1=min(LT[L[x]]-k[L[x]],LT[L[x+1]]-k[L[x+1]]);
if (EF[b]>DERTAb1) {s[a][b]=0;s[b][a]=0;continue;}}


if (EF[b]<0)
{DERTAb2=min(k[L[x]]-ET[L[x]],k[L[x+1]]-ET[L[x+1]]);

if ((0-EF[b])>DERTAb2) {s[a][b]=0;s[b][a]=0;continue;}}


for(j=6;j>=x;j--)
{L[j+1]=L[j];}
L[x]=a;

k[L[x+1]]=k[L[x+1]]+EF[L[x+1]];

k[L[x+2]]=k[L[x+2]]+EF[L[x+1]];
q[i]=qq;

M[i]=M[i]+1;
}
}

for(i=1;i<=3;i++)
{if (x==N[i+1]-1)
 {qq=q[i]+g[b];

if (qq>Q) {s[a][b]=0;s[b][a]=0;continue;}
EF[b]=k[a]+T[a]+t[a][b]-k[b];
if (EF[b]>=0) 
{DERTAb1=LT[b]-k[b];
if (EF[b]>DERTAb1) {s[a][b]=0;s[b][a]=0;continue;}}

if (EF[b]<0)
{DERTAb2=k[b]-ET[b];
if ((0-EF[b])>DERTAb2) {s[a][b]=0;s[b][a]=0;continue;}}

for(j=6;j>=x;j--)
{L[j+2]=L[j+1];L[x+1]=b;}

k[L[x+1]]=k[L[x+1]]+EF[L[x+1]];

M[i]=M[i]+1;
q[i]=qq;

}
}
}
s[a][b]=0;s[b][a]=0;
}




printf("得到的最终的路线为：\n");

for(i=1;i<=3;i++)
{printf("0->");
	for(j=N[i];j<N[i+1];j++){printf(" %d -> ",L[j]);}
	printf("0");
	printf("\n\n");
}

printf("\n\n");

printf("各路线的总任务量Q[i]为：\n");

for(i=1;i<=3;i++){printf("Q[%d]=%3.1f\n",i,q[i]);}

printf("\n\n");

printf("各路线的新的开始时间s[i]为：\n");
for(i=1;i<=8;i++){printf("s[%d]=%3.1f\n",i,k[i]);}

printf("\n\n");

system ("pause");
return(0);
}

float min(float x,float y)
{float z;z=x<y?x:y;return(z);}
