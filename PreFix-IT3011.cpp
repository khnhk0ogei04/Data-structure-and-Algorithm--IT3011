#include<bits/stdc++.h>
using namespace std;
	int cal( int a, int b, char c ){
		if ( c == '+' ) return a + b;
		if ( c == '-' ) return a - b;
		if ( c == '*' ) return a*b;
		if ( c == '/' && (b) ) return a/b;
	}
	int main(){
		string s;
		stack<int>st;
		std::cin>>s;
		for ( int i = s.length() - 1 ; i >= 0 ; i-- ){
			if (isdigit(s[i])){
				st.push(s[i]-'0');
			}
			else {
				int o1 = st.top(); st.pop();
				int o2 = st.top(); st.pop();
				st.push(o1,o2,s[i]);
			}
		}
		std::cout<<st.top();
		return 0;
	}
