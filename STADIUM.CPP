#include<bits/stdc++.h>
#define ll long long
#define db double
#define FOR(i,l,r) for ( int i = l ; i <= r ; i++ )
#define FOD(i,l,r) for ( int i = l ; i >= r ; i-- )
    using namespace std;
        struct club{
            int x,y,z;
        };
        club X[1001];
        int dp[1001], res = -1e9;
        bool cmp( club g, club h ){
            if ( g.y != h.y ) return g.y < h.y;
            return g.x < h.x;
        }
        int main(){
            int n;
            std::cin>>n;
            for ( int i = 1 ; i <= n ; i++ ){
                std::cin>>X[i].x>>X[i].y>>X[i].z;
            }
            for ( int i = 1 ; i <= n ; i++ ){
                dp[i] = X[i].z;
                for ( int j = 1 ; j < i ; j++ ){
                    if ( X[j].y <= X[i].x )
                    dp[i] = max( dp[i], dp[j] + X[i].z );
                }
            }
            for ( int i = 1 ; i <= n ; i++ ){
                res = max(res,dp[i]);
            }
            std::cout<<res;
            return 0;
        }
