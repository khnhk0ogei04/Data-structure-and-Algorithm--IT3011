#include<bits/stdc++.h>
#define int long long

std::string findstem(std::vector<std::string>arr){
	int n = arr.size();
	std::string s = arr[0];
	int len = s.length();
	std::string res = "";
	
	for ( int i = 0 ; i < len ; i++ ){
		for ( int j = 1 ; j <= len - i; j++ ){
		std::string stem = s.substr(i,j);
		int k = 1;
		for ( k = 1 ; k < n ; k++ ){
			if (arr[k].find(stem) == std::string::npos)
			break;
		}
		std::cout<<stem<<" "<<stem.length()<<" "<<k<<std::endl;
		if ( k == n && res.length() < stem.length() ){
			res = stem;
		}
	}
	}
	return res;
}
 	main(int argc,const char**argv){
	int n;
	std::cin>>n;
	std::vector<std::string>v;
	for ( int i = 1 ; i <= n ; i++ ){
		std::string s;
		std::cin>>s;
		v.push_back(s);
	}
	std::string res = findstem(v);
	std::cout<<res;
	return 0;
}
