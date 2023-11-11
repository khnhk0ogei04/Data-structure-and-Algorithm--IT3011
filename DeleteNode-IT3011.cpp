#include<bits/stdc++.h>
using namespace std;
	struct node{
		int data;
		node *left;
		node *right;
	};
	node *insert ( node *t, int x ){
		if ( t == NULL ){
			node *temp = new node;
			temp->data = x;
			temp->left = NULL;
			temp->right = NULL;
			return temp;
		}
		else {
			if ( x < t->data ){
				t->left = insert(t->left,x);
			}
			else t->right = insert(t->right,x);
		}
		return t;
	}
	void DeleteNode ( node *t ){
		if ( t != NULL ){
			if ( t->left != NULL ) DeleteNode(t->left);
			if ( t->right != NULL ) DeleteNode(t->right);
			delete(t);
		}
	}
	node *DeleteNumber(node *t, int x){
		
			
				if ( t->data == x ) {
					DeleteNode(t->left);
					DeleteNode(t->right);
                    delete(t);
				}
				else {
					if ( t->data > x ){
						t->left = DeleteNumber(t->left,x);
					}
					else t->right = DeleteNumber(t->right,x);
				}
		return t;
	}
	void PrintTree( node *t ){
		if ( t != NULL ){
			PrintTree(t->left);
			cout<<t->data<<" ";
			PrintTree(t->right);
		}
	}
	int main(){
		int n, x, temp;
		std::cin>>n;
		node * t = NULL;
	for (int i = 0; i < n; i++){
		cin >> temp;
		t = insert(t, temp);
	}
	cin >> x;
	t = DeleteNumber(t, x);
	if (t == NULL) cout <<"NULL";
	else PrintTree(t);
	return 0;
}
	