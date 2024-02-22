#include<bits/stdc++.h>
#include<iostream>
#include<stdio.h>
#include<math.h>
#include<queue>
#include<vector>
#include<stdlib.h>
#define ll long long
#define MAXN 10005
#define inf 1e9 + 7
int disc[MAXN][MAXN],V,E,s,t,sum = 0;
int NextNode[MAXN];
void Floyd(){ // Ham tim KC nho nhat theo Floyd
	for ( int k = 1 ; k <= V ; k++ ){
		for ( int i = 1 ; i <= V ; i++ ){
			if ( i != k )
			for ( int j = 1 ; j <= V ; j++ ){
				if ( j != i && j != k )
				disc[i][j] = std::min(disc[i][j],disc[i][k] + disc[k][j]);
			}
		}
	}
}
void init(){
	std::cin>>V>>E;
	for ( int i = 1 ; i <= E ; i++ ){
		int u,v,w;
		std::cin>>u>>v>>w;
		disc[u][v] = w;
		
	}
	std::cin>>s>>t;
}
void solve(int s, int t){
	for ( int k = 1 ; k <= V ; k++ ){
		if ( s == k || k == t ) continue;
		if (disc[s][k] + disc[k][t] == disc[s][t] ){
			NextNode[s] = k;
			NextNode[k] = t;
			solve(s,k); // Goi de quy den cac ham con
			solve(k,t); // Goi de quy den cac ham con
		}	
	}
}
void PrintSolution(){
	while ( s != -1 ){
		int x = s;
		std::cout<<s<<" ";
		s = NextNode[s];
		if (s != -1)
		sum += disc[x][s];
	}
}
int main( int argc, const char** argv ){
	std::memset(disc,inf,sizeof(disc));
	init();
	Floyd();
	sum = 0;
	NextNode[s] = t;
	NextNode[t] = -1;
	solve(s,t);
	PrintSolution();
	printf("\n%d",sum);
	return 0;
}

