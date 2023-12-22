#include<bits/stdc++.h>
const int MAXN = 1e5 + 1;

	void solve(){
		int n,A[MAXN];
		std::cin>>n;
		for ( int i = 1 ; i <= n ; i++ ){
			std::cin>>A[i];
		}
		int dem = 0;
		for ( int i = 1 ; i <= n ; i++ ){
			int pos = i - 1;
			int last = A[i];
			while ( pos >= 1  && (A[pos] > last) ){
				A[pos+1] = A[pos];
				pos--;
				}
				A[pos+1] = last;
				std::cout<<"BUOC "<<++dem<<":";
				for ( int k = 1; k <= n ; k++ ){
					std::cout<<A[k]<<" ";
				}
				std::cout<<std::endl;
			}
		
		}
	
	int main(){
		solve();
		return 0;
	}
