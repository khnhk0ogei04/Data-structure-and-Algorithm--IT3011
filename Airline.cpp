#include<bits/stdc++.h>
// http://csloj.ddns.net/problem/599
using namespace std;
#define ll long long
#define MAXN 105
#define pii pair<int, int> 
#define pip pair<int, pair<int, int>>

vector<pii> e[MAXN];
int d[MAXN][17];
pair<int, int> par[MAXN][17];
bool visited[MAXN][17];

int main(){
    memset(d, MAXN, sizeof(d));
    int n, m, c, a, s, t, u, v, k;
    cin>>n>>m>>c>>a>>s>>t;
    while (m--){
        cin>>u>>v>>k;
        e[u].push_back({v, k});
        e[v].push_back({u, k});
    }
    priority_queue< pip, vector<pip>, greater<pip> >pq;
    for (pair<int, int> i : e[s]){
        pq.push({0, {s, i.second}});
        d[s][i.second] = 0;
    }
    while (!pq.empty()){
        pair<int, int> i = pq.top().second;
        pq.pop();
        for (pair<int, int> j: e[i.first]){
            // TH1. Khong can chuyen tuyen giua 2 chuyen bay
            if (j.second == i.second && d[j.first][j.second] > d[i.first][i.second] + c){
                d[j.first][j.second] = d[i.first][i.second] + c;
                par[j.first][j.second] = {i.first, i.second};
                pq.push({d[j.first][j.second], {j.first, j.second}});
                continue;
            }
            if (j.second != i.second && d[j.first][j.second] > d[i.first][i.second] + c + a){
                d[j.first][j.second] = d[i.first][i.second] + c + a;
                par[j.first][j.second] = {i.first, i.second};
                pq.push({d[j.first][j.second], {j.first, j.second}});
            }
        }
    }
    vector<pair<int, pair<int, int>>> ans;
    int _min = INT_MAX, savek, p;
    for (int i = 1; i <= 16; i++){
        if (d[t][i] < _min){
            _min = d[t][i];
            savek = i;
        }
    }
    for (int i = t, j = savek; i != s; ){
        p = par[i][j].first;
        ans.push_back({p, {i, j}});
        j = par[i][j].second;
        i = p;
        p = par[p][j].first;
    }
    reverse(ans.begin(), ans.end());
    std::cout<<_min<<endl;
    for(pair<int, pair<int, int>> p : ans){
        cout<<p.first<<" "<<p.second.first<<" "<<p.second.second<<"\n";
    }
    return 0;
}
/* 37
1 2 1
2 3 1
3 4 1
4 9 1
9 8 1
8 7 1
7 13 2
13 14 3
14 15 3
15 10 3
10 5 3
*/
