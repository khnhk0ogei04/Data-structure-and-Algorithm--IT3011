#include<bits/stdc++.h>
using namespace std;

int _temp, temp[10001] = {};
int A[1001][1001] = {}, B[1001][1001] = {};

int n, k, m, u, v, w;
int cost = 0, _count = 0;
int pathmin = 10000001, _min = 10000001;
bool visited[100001];

void networks(int x){
	for (int i = 1; i <= temp[x]; i++){
		int _next = A[x][i];
		int _cost = B[x][i];
		if (!visited[_next] && cost + _cost + (k - _count) * pathmin < _min){
			std::cout<<"From "<<x<<" to"<<_next<<std::endl;
			cost += _cost;
			visited[_next] = true;
			if (_count++ < k){
				networks(_next);
			} else {
				_min = cost;
			}
			_count--;
			cost -= _cost;
			visited[_next] = false;
		}
	}
}


void initialize(){
	std::cin>>n>>k>>m;
	temp[0] = n;
	for (int i = 1; i <= n ; i++){
		A[0][i] = i;
	}
	for (int i = 1; i <= m ; i++){
		std::cin>>u>>v>>w;
		if (pathmin > w){
			pathmin = w;
		}
		_temp = ++temp[u];
		A[u][_temp] = v;
		B[u][_temp] = w;
		_temp = ++temp[v];
		A[v][_temp] = u;
		B[v][_temp] = w;
	}
	for (int i = 1; i < n + 1 ; i++){
		for (int j = 1 ; j <= temp[i]; j++){
			std::cout<<A[i][j]<<" ";					
		}
		std::cout<<std::endl;
	}	
}

int main(int argc, const char ** argv){
	initialize();
	networks(0);
	std::cout<<_min;
	return 0;
}
