#include<bits/stdc++.h>
using namespace std;
const int MAXN = 25;
int n, K, Q;
int d[MAXN];
bool visited[MAXN];

int X[MAXN], Y[MAXN];
int load[MAXN];
int cnt, segment;
void input(){
	segment = 0;
	cnt = 0;
	d[0] = 0;
	Y[0] = 0;
	std::cin>>n>>K>>Q;
	for (int i = 1 ; i <= n ; i++){
		std::cin>>d[i]; // d[i] is the packages client i needs
	}
	for (int i = 0; i <= n ; i++){
		load[i] = 0;
	}
}

int factorial(int n){
	if (n == 1) return 1;
	return n * factorial(n - 1);
}
bool checkY(int a, int i){
	if (visited[i]) return false;
	return true;
}

bool checkX(int a, int b, int i){
	if (i == 0) return true;
	if (load[a] + d[i] > Q) return false; // Overload
	if (visited[i]) return false;
	return true;
}
void solution(){
	if (segment == n){
		cnt++;
	}
}
void Try_X(int b, int a){
	for (int i = 0; i <= n ; i++){
		if (checkX(a, b, i)){
			X[b] = i; // The next position of truck b is i:
			visited[X[b]] = true;
			load[a] += d[X[b]];
			segment++;
			if (i) {
				Try_X(i, a);
			} else {
				if (a == K){
					solution();
				} else {
					Try_X(Y[a+1], a+1);
				}
			}
			segment--;
			visited[i] = false;
			load[a] -= d[X[b]];
		}
	}
}


void Try_Y(int a){
	for (int i = Y[i - 1] + 1; i <= n ; i++){
		if (checkY(a, i)){
			Y[a] = i;
			visited[i] = true;
			load[a] += d[Y[a]];
			if (a == K){
				Try_X(Y[1], 1);
			} else {
				Try_Y(a + 1);
			}
			visited[i] = false;
			load[a] -= d[Y[a]];
		}	
	}
}

int main(){
	input();
	Try_Y(1);
	std::cout<<cnt/factorial(K);
	return 0;
}
