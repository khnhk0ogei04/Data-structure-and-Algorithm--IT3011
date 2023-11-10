#include<bits/stdc++.h>
using namespace std;
int a[10][10];
int res = 0;
	void inp(){
		int n = 9;
		for (int i = 0 ; i < n ; i++ ) {
			for ( int j = 0 ; j < n ; j++ ){
				std::cin>>a[i][j];
			}
		}
	}
	bool check(int i, int j, int number){
		for ( int k = 0 ; k <= 8 ; k++ ){
			if (a[k][j] == number)
			return false;
		}
		for ( int l = 0 ; l <= 8 ; l++ ){
			if ( a[i][l] == number )
			return false;
		}
		int i1 = i - i%3;
		int j1 = j - j%3;
		for ( int k = i1 ; k <= i1 + 2 ; k++ ){
			for ( int l = j1 ; l <= j1 + 2 ; l++ ){
				if ( a[k][l] == number )
				return false;
			}
		}
		return true;
	}	
		void Try( int i, int j ){
			if ( i == 9 ){
				res+=1;
				
			}
			if ( j == 9){
				Try(i+1,0);
			}
			if (a[i][j] == 0){
				for ( int k = 1 ; k <= 9 ; k++ ){
					if (check(i,j,k)) {
						a[i][j] = k;
						Try(i,j+1);
						a[i][j] = 0;
					}
				}
			}
			else {
				Try(i,j+1);
			}
			
		}
		int main(){
			inp();
			Try(0,0);
			std::cout<<res;
		}
	// SUDOKU