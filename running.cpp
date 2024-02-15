#include<bits/stdc++.h>
#define MAXN 10005
#define ll long long
using namespace std;
    int dp[MAXN],n,m,p[MAXN];
    int A[MAXN];
    void solve(){
        std::cin>>n>>m;
        for ( int i = 1 ; i <= n ; i++ ){
            std::cin>>A[i];
            p[i] = p[i-1] + A[i];
        }
        dp[n] = 0;
        for ( int i = n - 1 ; i > 0 ; i-- ){
            dp[i] = dp[i+1];
            for ( int j = 1 ; j <= m ; j++ ){
                if (2*j <= n - i + 1)
                dp[i] = std::max(dp[i],p[i+j-1]-p[i-1]+dp[i+2*j]);
            }
        }
        std::cout<<dp[1];
    }
    int main(){
        solve();
        return 0;
    }
    
