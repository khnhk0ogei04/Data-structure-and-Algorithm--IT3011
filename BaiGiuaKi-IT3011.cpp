#include<bits/stdc++.h>
#define ldb long double
#define db double
#define FOR(i,l,r) for ( int i = l ; i <= r ; i++ )
#define FOD(i,l,r) for ( int i = l ; i >= r ; i-- )
using namespace std;
    string s;
	ldb cal ( ldb a, ldb b, char c ){
		if ( c == '+' ) return a+b;
		if ( c == '-' ) return a-b;
		if ( c == '*' ) return a*b;
		if ( c == '/' && (b) ) 
		return a/b;
	}
	int priority(char a){
		if ( a == '*' || a == '/' ) return 2;
		if ( a == '+' || a == '-' ) return 1;
		else return 0;
	}
	void inp(){
	    std::cin>>s;
	}
	
	void solve(){
		stack<char>st1;
		stack<long double>st2;
		for ( int i = 0 ; i < s.length() ; i++ ){
			if (s[i] == '('){
				st1.push(s[i]);
			}
			
			else if ( s[i] >= '0' && s[i] <= '9' ) {
				ldb temp = 0;
				while ( i < s.length() && (s[i] >= '0' && s[i] <= '9')){
					temp = temp * 10 + s[i] - '0';
					i++;
				}
				if ( s[i] == '.' ){
					i++;
					int k = -1;
					while ( isdigit(s[i]) && i < s.length() ){
						temp = temp + pow(10,k)*(s[i]-'0');
						k--;
						i++;
					}
				}
				i--;	
				st2.push(temp);
			}
			else if ( s[i] == ')' ){
				while (!st1.empty() && st1.top() != '('){
					ldb a = st2.top(); st2.pop();
					ldb b = st2.top(); st2.pop();
					st2.push(cal(b,a,st1.top()));
					st1.pop();
				}
				if (st1.top() == '(') 
				
				st1.pop();
			
		}
		else {
		
			while (!st1.empty() && priority(s[i]) <= priority(st1.top())) {
				ldb a = st2.top(); st2.pop();
				ldb b = st2.top(); st2.pop();
				st2.push(cal(b,a,st1.top()));
				st1.pop();
			}
		
			st1.push(s[i]);
			
	}
		}
	while (!st1.empty()){
		ldb a = st2.top(); st2.pop();
				ldb b = st2.top(); st2.pop();
				st2.push(cal(b,a,st1.top()));
				st1.pop();
		
	}
	if (!((st2.top() - (int)st2.top()))) std::cout<<(int)st2.top();
	else std::cout<<fixed<<setprecision(1)<<st2.top();

}
	int main(){
	    ios_base::sync_with_stdio(false);
	    cin.tie(NULL);
	    cout.tie(NULL);
	    inp();
		solve();
		return 0;
	}
