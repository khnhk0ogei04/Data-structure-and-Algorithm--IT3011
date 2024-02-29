#include<bits/stdc++.h>
#define ll long long
#define MAXN 100001
using namespace std;
int k,n,m;
std::vector<std::string>v;
char A[3][3];
int dx[] = {-1,-1,-1,0,0,1,1,1};
int dy[] = {-1,0,1,-1,1,-1,0,1};
bool visited[100][100];
std::vector<std::string>res;
bool inSize(int i, int j){
	return ( 1 <= i && i <= m && 1 <= j && j <= n );
}
void Try(int i,int j,string s){
	std::cout<<s<<std::endl;
	for (int t = 0 ; t < k ; t++){
		if (v[t] == s){
			res.push_back(s);
			return;
		}
	}
	for (int k = 0 ; k < 8 ; k++){
		int i1 = i + dx[k];
		int j1 = j + dy[k];
		if (inSize(i1,j1) && !visited[i1][j1]){
			visited[i1][j1] = true;
			Try(i1,j1,s + A[i1][j1]);
			visited[i1][j1] = false;
		}	
	}
}
int main(int argc, const char** argv){
	int t;
	std::cin>>t;
	while (t--){
		std::cin>>k>>m>>n;
		v.clear();
		res.clear();
		for ( int i = 1 ; i <= k ; i++ ){
			std::string s;
			std::cin>>s;
			v.push_back(s);
		}
		for (int i = 1 ; i <= m ; i++){
			for (int j = 1 ; j <= n ; j++){
				std::cin>>A[i][j];
			}
		}
		for (int i = 1; i <= m ; i++){
			for (int j = 1 ; j <= n ; j++){
				std::string s = "";
				memset(visited,false,sizeof(visited));
				visited[i][j] = true;
				Try(i,j,s+A[i][j]);
				visited[i][j] = false;
			}
		}
		std::cout<<res.size()<<"\n";
		for (auto x:res){
			std::cout<<x<<std::endl;
		}
	}
	return 0;
}
