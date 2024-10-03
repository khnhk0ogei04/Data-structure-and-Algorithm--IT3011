#include<iostream>
#include<algorithm>
#include<climits>
#include<vector>
#include<set>
#define MAXN 31

int m, n;
std::set<int> subject[MAXN];
int X[MAXN];
bool marked[MAXN][MAXN];
int teach[MAXN];
int res = INT_MAX;

void inp(){
    std::cin>>m>>n;
    int k;
    for (int i = 1; i <= m ; i++){
        std::cin>>k;
        for (int j = 1; j <= k; j++){
            int sub;
            std::cin>>sub;
            subject[sub].insert(i);
        }
    }
    std::cin>>k;
    for (int i = 1; i <= k; i++){
        int x, y;
        std::cin>>x>>y;
        marked[x][y] = true;
        marked[y][x] = true;
    }
}

bool check(int teacher, int sub){
    for(int i = 1; i < sub; i++){
        // If 2 subjects sub and i are conflicted, and subject i is assigned to teacher
        if (marked[sub][i] && X[i] == teacher){
            return false;
        }
    }
    return true;
}

void solution(){
    int tmp = -1;
    for (int i = 1; i <= m; i++){
        tmp = std::max(tmp, teach[i]);
    }
    res = std::min(res, tmp);
}

void Try(int sub){
    for (int teacher: subject[sub]){
        // Check if sub can be assigned to teacher 
        if (check(teacher, sub)){
            X[sub] = teacher;
            teach[teacher]++;
            if (teach[teacher] > res){
                teach[teacher]--;
                return;
            }
            if (sub == n) solution();
            else {
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
