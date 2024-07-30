#include<bits/stdc++.h>
using namespace std;
int n,m;
const int MAXN = 20;
int X[20], cost[20], A[MAXN][MAXN], sum[MAXN];
int res = INT_MAX;
void inp(){
	std::cin>>n>>m;
	for (int i = 1; i <= n ; i++){
		std::cin>>cost[i];
	}
	for (int i = 1; i <= n ; i++){
		for (int j = 1 ; j <= n ; j++){
			std::cin>>A[i][j];
		}
	}
}
bool check(int course, int period){
	for (int i = 1; i < course ; i++){
		if (A[i][course] == 1 && X[i] >= period) return false;
		if (A[course][i] == 1 && X[i] <= period) return false;
	}
	return true;
}
void solution(){
	int tmp_max = -1;
	for (int i = 1; i <= m ; i++){
		tmp_max = std::max(tmp_max, sum[i]);
	}
	res = std::min(tmp_max, res);
}
void Try(int course){
	for (int period = 1; period <= m ; period++){
		if (check(course, period)){
			X[course] = period;
			sum[period] += cost[course];
			if (course == n){
				solution();
			} else {
				Try(course + 1);
			}
			sum[period] -= cost[course];
		}
	}
}

int main(int argc, const char **argv){
	inp();
	Try(1);
	std::cout<<res<<endl;
	return 0;
}
