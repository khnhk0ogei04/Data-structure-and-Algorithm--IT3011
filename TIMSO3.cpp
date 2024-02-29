#include<bits/stdc++.h>
#include<math.h>
#define MAXN 100001
#define ll long long
using namespace std;
ll n,x;
bool scp(int x){
	double u = sqrt(x);
	return u == int(sqrt(x));
}
void solve(){
	std::cin>>n>>x;
	int i = 2,base = 1;
	while (i <= sqrt(x)){
		int cnt = 0;
		while ( x % i == 0 ){
			x /= i;
			cnt++;
		}
		if (cnt % 2 == 1) base = base*i;
		i++;
	}
	if (x > 1) base = base * x;
//	std::cout<<base<<"\n";
	for ( int i = 1 ; i <= n/base ; i++ ){
		if (scp(i)) std::cout<<base*i<<" ";
	}
	int key = int(sqrt(n/base));
	std::cout<<std::endl;
	std::cout<<key;
	
}
int main(int argc, const char**argv){
	solve();
	return 0;
}
