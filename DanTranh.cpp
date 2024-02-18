#include<bits/stdc++.h>
#define MAXN 200005
using namespace std;
	int n,A[MAXN],dp0[MAXN],dp1[MAXN];
	std::vector<int>adj[MAXN];
	void dfs(int u, int parent){
		dp0[u] = 0;
		dp1[u] = A[u];
		for (int v:adj[u]){
			if ( v != parent ){
				dfs(v,u);
				dp0[u] += dp1[v];
				dp1[u] += std::min(dp0[v],dp1[v]);
			}
		}
	}
	
	int main(int argc, const char** argv){
		std::cin>>n;
		for (int i = 1 ; i <= n ; i++){
			std::cin>>A[i];
		}
		for ( int i = 1 ; i <= n ; i++ ){
			int u;
			std::cin>>u;
			if ( u == 0 ) continue;
			adj[u].push_back(i);
			adj[i].push_back(u);
		}
		dfs(1,0);
		std::cout<<std::min(dp0[1],dp1[1]);
		return 0;
	}
