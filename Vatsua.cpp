#include<bits/stdc++.h>
using namespace std;
bool cmp( int x, int y ){
    return x > y;
}
    int main(){
        int n,A[1005];
        std::cin>>n;
        for ( int i = 1 ; i <= n ; i++ ){
            std::cin>>A[i];
        }
        std::sort(A+1,A+n+1,cmp);
        int res = 0, k = 0;
        for ( int i = 1 ; i <= n ; i++ ){
            if (A[i] < k) break;
            else {
            res += A[i] - k;
            k++;
        }
    }
    std::cout<<res;
    return 0;
    }
