#include<iostream>
#include<vector>
#include<queue>
#include<cstring>
typedef std::pair<int, int> pii;

int n, m, r, c;
const int MAXN = 1005;
int matrix[MAXN][MAXN];
int visited[MAXN][MAXN] = {0};

int dx[] = {-1, 0, 0, 1};
int dy[] = {0, -1, 1, 0};

bool insize(int i, int j){
    return i >= 1 && i <= n && j >= 1 && j <= m;
}

bool target(int i, int j){
    return i == 0 || i == n || j == 0 || j == m;
}

void inp(){
    std::cin>>n>>m>>r>>c;
    for (int i = 1; i <= n; i++){
        for (int j = 1; j <= m; j++){
            std::cin>>matrix[i][j];
        }
    }
}

void bfs(){
    std::queue<pii> q;
    q.push({r, c});
    while (q.size()){
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        for (int k = 0; k < 4; k++){
            int newRow = row + dy[k];
            int newCol = col + dx[k];
            if (visited[newRow][newCol] == 1 || matrix[newRow][newCol] == 1){
                continue;
            }
            if (target(newRow, newCol)){
                std::cout<<visited[row][col] + 1;
                return;
            }
            q.push({newRow, newCol});
            visited[newRow][newCol] = visited[row][col] + 1;
        }
    }
    std::cout<<"-1";
}

int main(int argc, const char ** argv){
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(0);
    inp();
    bfs();
    return 0;
}
