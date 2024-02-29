#include <bits/stdc++.h>
using namespace std;

int n, k, sum, A[21], check[21], ok = 0;
std::vector<std::vector<int>>v;

void Try(int i, int sum1, int cnt) {
    if (ok) return; 
    if (cnt == k) {
        ok = 1;
        for (auto x : v) {
            for (auto it = x.begin(); it != x.end() ; it++) {
                std::cout << *it << " ";
            }
            cout << endl;
        }
        return;
    }
    if (sum1 == sum) {
        Try(0, 0, cnt + 1);
        return;
    }
    for (int j = i; j < n; j++) {
        if (check[j] == 0) {
            check[j] = 1;
            v[cnt].push_back(A[j]);
            if (sum1 + A[j] <= sum) {
                Try(j + 1, sum1 + A[j], cnt);
            }
            check[j] = 0;
            v[cnt].pop_back();
        }
    }
}

int main() {
    cin >> n >> k;
    sum = 0;
    for (int i = 0; i < n; i++) {
        cin >> A[i];
        sum += A[i];
    }
    if (sum % k != 0) {
        cout << "NO";
    } else {
        memset(check, 0, sizeof(check));
        sum = sum / k;
        v.resize(k);
        Try(0, 0, 0);
        if (ok)
            cout << "YES";
        else
            cout << "NO";
        }
    return 0;
}
