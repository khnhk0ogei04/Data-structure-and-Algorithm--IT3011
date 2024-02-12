#include<bits/stdc++.h>
typedef std::pair<int,int> pii;
const int MAXN = 1005;
    int n,m,r,c,ok = 0;
    int A[MAXN][MAXN],dem[MAXN][MAXN];
    bool visited[MAXN][MAXN];
    int dx[] = {-1,0,0,1};
    int dy[] = {0,-1,1,0};
    std::map<std::pair<int,int>, int>mp;
    std::queue<std::pair<int,int>>q;
    int target(int u, int v){
        if ( u < 1 || u > n || v < 1 || v > m )
        return 1;
    return 0;
    }
    bool InTable( int i, int j ){
        return ( i >= 1 && i <= n && j >= 1 && j <= m );
    }
    void solve(){
        std::cin>>n>>m>>r>>c;
        memset(A,1,sizeof(A));
        memset(dem,0,sizeof(dem));
        for ( int i = 1 ; i <= n ; i++ ){
            for ( int j = 1 ; j <= m ; j++ ){
                std::cin>>A[i][j];
            }
        }
        q.push({r,c});
        while (!q.empty()){
            if (ok) break;
            int i = q.front().first;
            int j = q.front().second;
            visited[i][j] = true;
            q.pop();
                for ( int k = 0 ; k < 4 ; k++ ){
                int i1 = i + dy[k];
                int j1 = j + dx[k];
                if (target(i1,j1)){
                    ok = 1;
                    dem[i1][j1] = dem[i][j] + 1;
                    std::cout<<dem[i1][j1];
                    break;
                }
                else{
                    if (!visited[i1][j1] && InTable(i1,j1) && A[i1][j1] == 0){
                        q.push({i1,j1});
                        dem[i1][j1] = dem[i][j] + 1;
                    }
                }
            }
        }
        if (!ok) std::cout<<"-1";
    }
        int main(){
            solve();
            return 0;
        }
