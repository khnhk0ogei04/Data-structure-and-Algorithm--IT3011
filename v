#include<bits/stdc++.h>
using namespace std;
    struct node{
        int data;
        node *left;
        node *right;
    };
    node *tmp;
    void findnode ( node *t, int x ){
        if ( t->data == x ) {
            tmp = t;
            return;
        }
        else {
            findnode(t->left,x);
            findnode(t->right,x);
        }
    }
    node *insert ( node *t,int u, int key, int x ){
        if ( t == NULL ){
            node *temp = new node;
            temp->data = x;
            temp->left = NULL;
            temp->right = NULL;
            return temp;
        }
        else {
            node *q = t;
            findnode(q,key);
            node *temp = new node;
            temp->data = x;
            temp->left = temp->right = NULL;
            if (u) tmp->right = temp;
            else tmp->left = temp;
        }
        return t;
    }
   
    void PreOrder( node *t ){
        if ( t != NULL ){
            std::cout<<t->data<<" ";
            PreOrder(t->left);
            PreOrder(t->right);
        }
    }
    void InOrder( node *t ){
        if ( t != NULL ){
            InOrder(t->left);
            std::cout<<t->data<<" ";
            InOrder(t->right);
        }
    }
    void PostOrder( node *t ){
        if ( t != NULL ){
            PostOrder(t->left);
            PostOrder(t->right);
            std::cout<<t->data<<" ";
        }
    }
    int main(){
        int n;
        std::cin>>n;
        int A[1001];
        for ( int i = 1 ; i <= n ; i++ ){
            std::cin>>A[i];
        }
        node *t = new node;
        t->data = A[1];
        t->left = t->right = NULL;
        for ( int i = 2 ; i <= n ; i++ ){
            t = insert(t, i % 2, A[i/2], A[i]);
        }
        InOrder(t);
        return 0;
    }
    
    
