#include<bits/stdc++.h>
#define MAXN 200001
#define ll long long
	using namespace std;
	std::vector<int>adj[MAXN];
	int dmax,umax,n,A[MAXN];
	
	void dfs( int u, int parent, int depth ){
		if (depth > dmax){
			dmax = depth;
			umax = u;
		}
		for ( int v: adj[u] ){
			if ( v != parent ){
				dfs(v,u,depth+1);
			}
		}
	}
	
	int main( int argc, const char** argv ){
		ios_base::sync_with_stdio(false);
		std::cin.tie(NULL);
		std::cout.tie(NULL);
		std::cin>>n;
	/*	for ( int i = 1; i <= n ; i++ ){
			std::cin>>A[i];
		} */
		for ( int i = 1 ; i <= n ; i++ ){
			int u;
			std::cin>>u;
			if ( u == 0 ) continue;
			adj[u].push_back(i);
			adj[i].push_back(u);
		}
		umax = -1;
		dfs(1,0,0);
		dmax = 0;
		dfs(umax,0,0);
		std::cout<<dmax;
		return 0;
	}
		
