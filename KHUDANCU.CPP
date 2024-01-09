#include<bits/stdc++.h>
const int MAXN = 2005;
using namespace std;
    int m,n,d,k;
    int D[200005],P[200005],D1[MAXN][MAXN],P1[MAXN][MAXN];
    char A[MAXN][MAXN];
    char B[2][400005];
    void inp1(){
        for ( int i = 1 ; i <= m ; i++ ){
            for ( int j = 1 ; j <= n ; j++ ){
                std::cin>>B[i][j];
            }
        }
    }
    void inp2(){
        for ( int i = 1 ; i <= m ; i++ ){
            for ( int j = 1 ; j <= n ; j++ ){
                std::cin>>A[i][j];
            }
        }
    }
    void sub2(){
        inp1();
        memset(D,0,sizeof(D));
        memset(P,0,sizeof(P));
        for ( int i = 1 ; i <= n ; i++ ){
            if ( B[1][i] == 'M' ) {
            if ( i > d )    D[i-d]++;
            else D[1]++;
                             D[i+d+1]--;
            }
        }
        P[1] = D[1];
        for ( int i = 2 ; i <= n ; i ++ ){
            P[i] = P[i-1] + D[i];
    //        std::cout<<P[i]<<" ";
        }
        int cnt = 0;
        for ( int i = 1 ; i <= n ; i++ ){
            if ( B[1][i] == 'P' && P[i] >= k) cnt++;
        }
        std::cout<<cnt<<std::endl;
    }
    void sub4(){
        inp2();
        std::memset(D1,0,sizeof(D1));
        std::memset(P1,0,sizeof(P1));
        for ( int i = 1 ; i <= m ; i++ ){
            for ( int j = 1 ; j <= n ; j++ ){
                if (A[i][j] == 'M'){
                int k = std::max(i-d,1);
                int l = std::max(j-d,1);

                D1[k][l]++;
                D1[k][j+d+1]--;
                D1[i+d+1][l]--;
                D1[i+d+1][j+d+1]++;
                }
            }
        }
        P1[1][1] = D1[1][1];
        for ( int i = 2 ; i <= m ; i++ ){
            P1[i][1] = P1[i-1][1] + D1[i][1];
        }
        for ( int i = 2 ; i <= n ; i++ ){
            P1[1][i] = P1[1][i-1] + D1[1][i];
        }
        int cnt = 0;
        for ( int i = 2 ; i <= m ; i++ ){
            for ( int j = 2 ; j <= n ; j++ ){
                P1[i][j] = P1[i-1][j] + P1[i][j-1] - P1[i-1][j-1] + D1[i][j];
            }
        }
        for ( int i = 1 ; i <= m ; i++ ){
            for ( int j = 1 ; j <= n ; j++ ){
                if (A[i][j] == 'P' && P1[i][j] >= k)
                cnt++;
            }
        }
        std::cout<<cnt<<std::endl;
    }
    int main(){
       freopen("KHUDANCU.INP","r",stdin);
       freopen("KHUDANCU.OUT","w",stdout);
        std::cin>>m>>n>>d>>k;
        if ( m == 1 ) sub2();
        else sub4();
        return 0;
    }
