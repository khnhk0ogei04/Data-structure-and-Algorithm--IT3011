#include<bits/stdc++.h>
#define MAXN 101
using namespace std;
int n,m,k;
bool visited[MAXN][MAXN][4]; // 0: left, 1: top, 2: right, 3: down
int A[MAXN][MAXN];
int dx[] = {-1,0,1,0};
int dy[] = {0,-1,0,1};
bool go[MAXN][MAXN];
bool insize(int x,int y){
	return (1 <= x && x <= n) && (1 <= y && y <= n);
}
std::queue<std::pair<int,int>>q;
void inp(){
	std::cin>>n>>k>>m;
	memset(visited,true,sizeof(visited));
	for (int i = 0 ; i < m ; i++){
		int x,y,z,t;
		std::cin>>x>>y>>z>>t;
		if (x == z ){
			if (t-y == 1){
				visited[x][y][2] = false;
				visited[z][t][0] = false;
			}
			if (y-t == 1){
				visited[x][y][0] = false;
				visited[x][t][2] = false;
			}
		}
		if ( y == t ){
			if (z-x == 1){
				visited[x][y][3] = false;
				visited[z][t][1] = false;
				
			}
			if (x-z == 1){
				visited[x][y][1] = false;
				visited[z][t][3] = false;
			}
		}
	}
	for (int i = 1; i <= k ; i++){
		int x,y;
		std::cin>>x>>y;
		A[x][y] = 1;
		q.push({x,y});
	}
	
}
void bfs(int x,int y){
	go[x][y] = true;
	for (int i = 0 ; i < 4 ; i++){
		int x1 = x + dx[i];
		int y1 = y + dy[i];
		if (!go[x1][y1] && visited[x][y][i] && insize(x1,y1)){
			bfs(x1,y1);
		}
	}
}
int cnt(int x, int y){
	int dem = 0;
	for (int i = 1 ; i <= n ; i++){
		for (int j = 1 ; j <= n ; j++){
			if (i == x && j == y) continue;
			if (A[i][j] && go[i][j])
			dem += 1;
		}
	}
	return dem;
}
int main(int argc,const char** argv){
	inp();
	int count = 0;
	while (!q.empty()){
		std::pair<int,int>p = q.front();
		q.pop();
		int x = p.first;
		int y = p.second;
		memset(go,false,sizeof(go));
		bfs(x,y);
		count += cnt(x,y);
	}
	std::cout<<count/2;
	return 0;
}
/* 3 3 3
2 2 2 3
3 3 3 2
3 3 2 3
3 3
2 2
2 3 */
