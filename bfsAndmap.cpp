#include<bits/stdc++.h>
#define N 1001
#define pii pair<int,int>
using namespace std;
	int dx[] = {-1,0,0,1};
	int dy[] = {0,-1,1,0};
	vector<pii> tmp[1000001];
	int m,n,x,y,z,t;
	int A[N][N],B[N][N];
	void roirachoa(){
		map<int,int>mp;
		for ( int i = 1 ; i <= m ; i++ ){
			for ( int j = 1 ; j <= n ; j++ ){
				if (A[i][j]) {
					int u = A[i][j];
					if (mp[u] == 0)  mp[u] = mp.size();
					A[i][j] = mp[u];
				}
			}
		}
	}
	bool insize( int x, int y ){
		return ( (1 <= x && x <= m) && ( 1 <= y && y <= n ) );
	}
	void bfs( int x, int y ){
		B[x][y] = 1;
		queue<pair<int,int>>q;
		q.push({x,y});
			while (!q.empty()){
				int u = q.front().first;
				int v = q.front().second;
				if ( u == z && v == t ) return;
				q.pop();
				for ( int i = 0 ; i < 4 ; i++ ){
					if (insize(u+dx[i],v+dy[i]))
						if (A[u+dx[i]][v+dy[i]] > 0 && B[u+dx[i]][v+dy[i]] == 0) {
							B[u+dx[i]][v+dy[i]] = B[u][v] + 1;
							q.push({u+dx[i],v+dy[i]});
						}
				}
					if (tmp[A[u][v]].size() == 1) continue;
					for ( auto k : tmp[A[u][v]] ){
						if (B[k.first][k.second] == 0){
							B[k.first][k.second] = B[u][v] + 1;
							q.push({k.first,k.second});
						}
					}	
						
				}
			}
			int main(){
				std::cin>>m>>n;
				std::cin>>x>>y>>z>>t;
				for ( int i = 1 ; i <= m ; i++ ){
					for ( int j = 1 ; j <= n ; j++ ){
						std::cin>>A[i][j];
					}
				}
				roirachoa();

				for ( int i = 1 ; i <= m ; i++ ){
					for ( int j = 1 ; j <= n ; j++ ){
						tmp[A[i][j]].push_back({i,j});
					}
				}
				bfs(x,y);
				std::cout<<B[z][t]-1;
				return 0;
			}
			
			
	
