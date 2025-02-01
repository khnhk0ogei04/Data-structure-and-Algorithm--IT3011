#include<bits/stdc++.h>
using namespace std;

const int MAXN = 100005;
const int MOD = 1e9 + 7;
// Subtask 3: 20% points have n, x <= 5000
int n, x;
int a[MAXN];
int dp[5005][5005];
int main(int argc, const char** argv){
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    cin >> n >> x;
    long long num = 0;
    for (int i = 1; i <= n; i++){
        cin >> a[i];
    }
    // dp[i][j]: The number of ways to form j from i first elements
    dp[0][1] = 1;
    for (int i = 1; i <= n; i++){
        for (int j = 1; j <= x; j++){
            dp[i][j] = dp[i - 1][j];
            if (j % a[i] == 0) dp[i][j] += dp[i - 1][j / a[i]];
            dp[i][j] %= MOD;
        }
    }
    for (int i = 1; i <= x; i++){
        num += dp[n][i];
        num %= MOD;
    }
    cout << (num - 1 + MOD) % MOD;
    return 0;
}
/*
4 6
2 3 3 4
6
*/
