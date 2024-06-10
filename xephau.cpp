#include<bits/stdc++.h>
using namespace std;
int A[11][11],n,sum, res = 0;
    void inp(){
        std::cin>>n;
        for ( int i = 0 ; i < n ; i++ ){
            for ( int j = 0 ; j < n ; j++ ){
                A[i][j] = 0;
            }
        }
    }
    bool check( int i, int j ){
        for ( int k = 0 ; k < n ; k++ ){
            for ( int l = 0 ; l < n ; l++ ){
                if ( A[i][l] == 1 ) return false;
                if ( A[k][j] == 1 ) return false;
                int p = 1, q = 1;
                while ( i >= p && j >= p ) {
                    if ( A[i-p][j-p] == 1 ) return false;
                    p++;
                }
                while ( i >= q && j <= n - q ){
                    if ( A[i-q][j+q] == 1 ) return false;
                    q++;
                }
            }
        }
        return true;
    }
    void Try( int i, int j ){
        if ( i == n ){
            int sum = 0;
            for ( int i = 0 ; i < n ; i++ ){
                for ( int j = 0 ; j < n ; j++ ){
                    sum += A[i][j];
                }
            }
       if ( sum == n ) {
       	res++;
    	for ( int i = 0 ; i < n ; i++ ){
    		for ( int j = 0 ; j < n ; j++ ){
    			std::cout<<A[i][j]<<" ";
    		}
    		std::cout<<endl;
    	}
    	cout<<endl;
       }
       return;
   }
   
     
        if ( i < n && j == n ){
            Try(i+1,0);
        }
        else {
            if (!A[i][j]){
                if (check(i,j)) {
                    A[i][j] = 1;
                    Try(i,j+1);
                    A[i][j] = 0;
                }
                Try(i,j+1); 
                
            }
            else Try(i,j+1);
        }
    }
    int main(){
        inp();
        for ( int j = 0 ; j < n ; j++ ){
            A[0][j] = 1;
            Try(1,0);
            A[0][j] = 0;
        }
        
        std::cout<<res;
        
    }
