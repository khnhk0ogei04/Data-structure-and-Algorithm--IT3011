#include<iostream>
#include<algorithm>
#include<vector>
#include<climits>

const int MAXN = 31;

using namespace std;

int m, n;
vector<int> subject[MAXN];
bool marked[MAXN][MAXN];
int X[MAXN], teach[MAXN];
int res = INT_MAX;

void inp(){
	cin >> m >> n;
	for (int i = 1; i <= m; i++){
		int k;
		cin >> k;
		for (int j = 1; j <= k; j++){
			int sub;
			cin >> sub;
			subject[sub].push_back(i);
		}
	}
	int k;
	cin >> k;
	for (int i = 1; i <= k; i++){
		int x, y;
		cin >> x >>y;
		marked[x][y] = true;
		marked[y][x] = true;
	}
}

bool check(int teacher, int sub){
	for (int i = 1; i < sub; i++){
		if (marked[sub][i] && X[i] == teacher){
			return false;
		}
	}
	return true;
}

void solution(){
	int tmp = -1;
	for (int i = 1; i <= m; i++){
		tmp = max(tmp, teach[i]);
	}
	res = min(res, tmp);
}

void Try(int sub){
	for (int teacher: subject[sub]){
		if (check(teacher, sub)){
			X[sub] = teacher;
			teach[teacher] += 1;
			if (teach[teacher] > res){
				teach[teacher]--;
				return;
			}
			if (sub == n){
				solution();
			} else {
				Try(sub + 1);
			}
			teach[teacher]--;
		}
	}
}

int main(int argc, const char** argv){
    inp();
    Try(1);
    if (res != INT_MAX){
        std::cout<<res<<"\n";
    } else {
        std::cout<<"-1";
    }
}
/*
7 20
10 4 19 12 14 16 7 10 5 11 9
5 6 17 12 4 19
5 9 1 20 16 3
10 6 14 7 16 12 15 3 2 10 4
8 12 14 13 10 18 11 20 3
9 7 13 20 19 17 2 4 8 14
1 7
8
4 2
18 9
2 15
9 8
10 17
20 13
17 10
18 8
4
*/
