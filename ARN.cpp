#include<bits/stdc++.h>
#include<string.h>
std::string s,t;
void solve(){
	std::cin>>s;
	std::cin>>t;
	int cnt = 0;
	while (s.find(t) != -1){
		int x = s.find(t);
		s.replace(0,x+t.size(),""); // thay the tu vi tri a den vi tri b bang xau s
		cnt++;
	}
	printf("%d",cnt);
}
int main(int argc, const char** argv){
	solve();
	return 0;
}
