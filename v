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
            findnode(t->right,x)
        }
    }
    node *insert ( node *t,int u, int x ){
        if ( t == NULL ){
            node *temp = new node;
            temp->data = x;
            temp->left = NULL;
            temp->right = NULL;
            return temp;
        }
        else {
            node *q = t;
            findnode(q,x);
            node *temp = new node;
            temp->data = x;
            temp->left = temp->right = NULL;
            if (u) tmp->right = temp;
            else tmp->left = temp;
        }
        return t;
    }
    
