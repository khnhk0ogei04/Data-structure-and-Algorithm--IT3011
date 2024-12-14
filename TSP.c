#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>

#define MAXN 1005
#define INF 1e9 + 7

int n;
int c[MAXN][MAXN];
bool visited[MAXN];
int X[MAXN];
int best = INF, currSum, cmin = INF;

int min(int u, int v){
    return (u < v) ? u : v;
}

void inp(){
    scanf("%d", &n);
    for (int i = 1; i <= n; i++){
        for (int j = 1; j <= n; j++){
            scanf("%d", &c[i][j]);
            if (c[i][j] != 0) cmin = min(cmin, c[i][j]);
        }
    }
}

void Try(int k){
    if (currSum + cmin * (n - k + 1) >= best){
        return;
    }

    for (int v = 2; v <= n; v++){
        if (!visited[v]){
            visited[v] = true;
            X[k] = v;
            currSum += c[X[k - 1]][v];
            if (k == n){
                if (currSum + c[X[k]][1] < best){
                    best = currSum + c[X[k]][1];
                }
            } else {
                Try(k + 1);
            }
            visited[v] = false;
            currSum -= c[X[k - 1]][v];
        }
    }
}

int main(){
    inp();
    X[1] = 1;
    Try(2);
    printf("%d", best);
    return 0;
}

/*
4
0 2 1 3
4 0 1 2
2 1 0 3
3 4 2 0
7
*/
