 #include<bits/stdc++.h>
 typedef std::pair<int,int> pii;
 #define ll long long
 #define MAXN 101
 #define MAXM 1001
 	using namespace std;
 	int B[MAXM],E[MAXM];
 	int X[MAXN];
 	int sz[MAXN],parent[MAXN];
 	int n,m,ans = 0;
 		void init(){
 			for ( int i = 1 ; i <= n ; i++ ){
 				parent[i] = i;
 				sz[i] = 1;
			 }
		 }
		 void printSolution(){
		 	ans++;
		 	for ( int i = 1 ; i <= n - 1 ; i++ ){
		 		std::cout<<X[i]<<" ";
			 }
			 std::cout<<std::endl;
		 }
		 int Find( int u ){
		 	if ( u == parent[u] ) return u;
		 	return parent[u] = Find(parent[u]);
		 }
		 
		 void link( int x, int y ){
		 	if (sz[x] > sz[y]) parent[y] = x;
		 	else {
		 		parent[x] = y;
		 		if (sz[x] == sz[y]) sz[y] = sz[x] + 1;
			 }
		 }
		 void inp(){
		 	std::cin>>n>>m;
		 	for ( int i = 1 ; i <= m ; i++ ){
		 		std::cin>>B[i]>>E[i];
			 }
		 }
		 int check(int v, int k){
		 	init();
		 	for ( int i = 1 ; i < k ; i++ ){
		 		int u = B[X[i]];
		 		int w = E[X[i]];
		 		u = Find(u);
		 		w = Find(w);
		 		if ( u == w) return 0;
		 		link(u,w);
			 }
		 	if (Find(B[v]) == Find(E[v])) return 0;
		 	return 1;
		 }
		 void Try( int k, int last ){
		 	for ( int v = last + 1 ; v <= m ; v++ ){
		 		if (check(v,k)){
		 			X[k] = v;
		 			if ( k == n - 1 ){
		 				printSolution();
		 			}
					else Try(k+1,v);
				 }
			 }
		 }
		 void solve(){
		 	inp();
		 	Try(1,0);
		 	std::cout<<ans;
		 }
		 int main(){
		 	solve();
		 	return 0;
		 }
		 
		 
		 
