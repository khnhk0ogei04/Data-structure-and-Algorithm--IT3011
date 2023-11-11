#include<bits/stdc++.h>
#define ll long long
#define FOR(i,l,r) for ( int i = l ; i <= r ; i++ )
#define FOD(i,l,r) for ( int i = l ; i >= r ; i-- )
	using namespace std;
		int n,P,Q,k,X[21],A[21],ok = 0,cnt = 0;
		vector<int>t;
		vector<vector<int>>v;
		void inp(){
			std::cin>>n>>P>>Q;
			for ( int i = 1 ; i <= n ; i++ ) {
			    std::cin>>A[i];
			}
		}
		void PrintSolution(){
		    for ( int i = 1 ; i <= k ; i++ ){
				t.push_back(A[X[i]]);
			}
			v.push_back(t);
			t.clear();
		}
		void check() {
		   FOR(i,0,v.size()-1)
		   {
		       int sum = 0;
		       for ( auto x: v[i] ){
		           sum += x;
		       }
		       if ( sum >= P && sum <= Q ){
		           cnt++;
		       }
		   }
		   std::cout<<cnt;
		}
		
		void ktao(){
			for ( int i = 1 ; i <= k ; i++ ){
				X[i] = i;
			}
		}
		
		void sinh(){
			int i = k;
			while ( i >= 1 && X[i] == n - k + i ) {
				i--;
			}
			if ( i == 0 ) {
				ok = 1;
			}		
			else {
				X[i]++;
				for ( int j = i + 1 ; j <= k ; j++ ){
					X[j] = X[j-1] + 1;
				}
			}
		}
		void Try(){
		    k = 1;
		    while ( k <= n ) {
		        ktao();
		        PrintSolution();
		        while (!ok) {
		            sinh();
		            if (!ok) {
		                PrintSolution();
		            }
		      }
		       if (ok) {
		           k++;
		           ok = 0;
		       } 
		    }
		}
		
		int main(){
		    ios_base::sync_with_stdio(false);
		    cin.tie(NULL);
		    cout.tie(NULL);
			inp();
			Try();
			check();
			return 0;
		}
			
			
		