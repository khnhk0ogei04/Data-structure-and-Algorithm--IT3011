#include<bits/stdc++.h>
const int MAXN = 1e3 + 1;
using namespace std;
#define fi first
#define se second
    int n,m,u;
    std::vector<int> adj[MAXN];
    std::vector<std::pair<int,int>> res;
    bool visited[MAXN];
    void inp(){
        std::cin>>n>>m>>u;
        std::memset(visited,false,sizeof(visited));
        for ( int i = 1 ; i <= m ; i++ ){
            int a,b;
            std::cin>>a>>b;
            adj[a].push_back(b);
            adj[b].push_back(a);
        }
    }
    void bfs( int u ){
        std::queue<int>q;
        q.push(u);
        visited[u] = true;
        while (!q.empty()){
            int k = q.front(); q.pop();
            for ( int v : adj[k] ){
                if (!visited[v]){
                    res.push_back({k,v});
                    q.push(v);
                    visited[v] = true;
                }
            }
        }
    }
    void solve(){
        inp();
        bfs(u);
        if (res.size() < n - 1) std::cout<<"-1";
        else {
        for ( auto x: res ){
            std::cout<<x.fi<<" "<<x.se<<std::endl;
        }
        }
    }
    int main(){
        solve();
        return 0;
    }
