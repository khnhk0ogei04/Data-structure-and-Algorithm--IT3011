#include<bits/stdc++.h>
#define ll long long
#define MAXN 1e5 + 5
    long long dp[205][205],n;
    void solve(){
        std::string s;
        std::cin>>s;
        n = s.length();
        s = " " + s;
        for ( int i = 1; i <= n ; i++ ) dp[i][i] = 1;
        for ( int i = 2 ; i <= n ; i++ ) dp[i][i-1] = 0;
        for ( int len = 1 ; len <= n - 1 ; len++ ){
            for ( int i = 1 ; i <= n - len ; i++ ){
                int j = i + len;
                if (s[i] != s[j])
                    dp[i][j] = dp[i][j-1] + dp[i+1][j] - dp[i+1][j-1];
                else 
                    dp[i][j] = dp[i+1][j] + dp[i][j-1] + 1;
            }
        }
        std::cout<<dp[1][n];
    }
    int main(){
        solve();
        return 0;
    }
