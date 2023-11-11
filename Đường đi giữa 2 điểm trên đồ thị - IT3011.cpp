#include<bits/stdc++.h>
#define ll long long

#define FOR(i,l,r) for ( int i = l ; i <= r ; i++ )
#define FOD(i,l,r) for ( int i = l ; i >= r ; i-- )
    using namespace std;
    vector<int>adj[1001]; int parent[1001];
    vector<int>res;
    int n,m,s,t;
    bool visited[1001];
    void inp(){
            std::cin>>n>>m>>s>>t;
            for ( int i = 1 ; i <= m ; i++ ){
            int u,v;
            std::cin>>u>>v;
            adj[u].push_back(v);
            adj[v].push_back(u);
        }
    }
    void dfs(int u){
        visited[u] = true;
        
        for ( int v : adj[u] ){
            if (!visited[v]) {
                dfs(v);
                parent[v] = u;
            }
       }
    }
    void Path( int s, int t ) {
        if (!visited[t]) {
            std::cout<<"NO";
        }
        else {
            while ( t != s ){
                res.push_back(t);
                t = parent[t];
            }
            res.push_back(s);
            reverse(res.begin(),res.end());
            for ( int i = 0 ; i < res.size() ; i++ ) {
                std::cout<<res[i]<<" ";
            }
        }
    }
    int main(){
        ios_base::sync_with_stdio(false);
        cin.tie(NULL);
        cout.tie(NULL);
        inp();
        dfs(s);
        Path(s,t);
        return 0;
    }