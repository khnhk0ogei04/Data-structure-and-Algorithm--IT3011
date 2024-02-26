#include<iostream>
#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>
#include<queue>
#include<algorithm>
#include<vector>
#include<math.h>
#include<stack>
#define MAXN 100001
using namespace std;
	typedef struct TreeNode{
		int data;
	//	TreeNode *parent;
		TreeNode *firstChild;
		TreeNode *nextSibling;
		TreeNode( int x ){
			data = x;
			firstChild = NULL;
			nextSibling = NULL;
		}
	}TreeNode;
	
	TreeNode *makeNewNode( int x ){
		return new TreeNode(x);
	}
	TreeNode *findKey( TreeNode *t, int x ){
		if ( t == NULL ) return NULL;
		if (t->data == x){
			return t;
		}
		TreeNode *result = findKey(t->firstChild,x);
		if (result == NULL){
			result = findKey(t->nextSibling,x);
		}
		return result;
	}
	void addNodeIntoTree( TreeNode *t, int x, int y ){
		if ( t == NULL ){
			TreeNode *t = new TreeNode(y);
		}
		else{
			TreeNode *temp = findKey(t,x);
			if (temp->firstChild == NULL){
				temp->firstChild = new TreeNode(y);
			}
			else {
				TreeNode *currNode = temp->firstChild;
				while (currNode->nextSibling != NULL){
					currNode = currNode->nextSibling;
				}
				currNode->nextSibling = new TreeNode(y);
			}
		}
	}
	void PreOrder(TreeNode *t){
    if ( t == NULL ) return;
    std::cout<<t->data<<" ";
    PreOrder(t->firstChild); // Traverse first child
    
    TreeNode *currChild = t->firstChild;
    while (currChild != NULL) { // Traverse siblings
        PreOrder(currChild->nextSibling);
        currChild = currChild->nextSibling;
    }
}	
	void PostOrder(TreeNode* t){
		if (t == NULL) return;
		TreeNode *currChild = t->firstChild;
		PostOrder(currChild);
		while (currChild != NULL){
			currChild = currChild->nextSibling;
			PostOrder(currChild);
		}
		std::cout<<t->data<<" ";
	}
	void InOrder(TreeNode *t){
		if (t == NULL) return;
		TreeNode *currChild = t->firstChild;
		
		while (currChild != NULL && currChild->nextSibling != NULL ){
			InOrder(currChild);
			currChild = currChild->nextSibling;
		}
		std::cout<<t->data<<" ";
		InOrder(currChild);
	}
	void levelOrder(TreeNode *t){
		if (t == NULL){
			return;
		}
		std::queue<TreeNode*>myQueue;
		myQueue.push(t);
		TreeNode *currNode,*currChild;
		while (!myQueue.empty()){
			currNode = myQueue.front();
			myQueue.pop();
			std::cout<<currNode->data<<" ";
			currChild = currNode->firstChild;
			while (currChild != NULL){
				myQueue.push(currChild);
				currChild = currChild->nextSibling;
			}
		}
	}
    int height(TreeNode *t){
        if ( t == NULL ) return 0;
        if (t->firstChild == NULL) return 1;
        int maxChildHeight = -100, currChildHeight;
        TreeNode *currChild = t->firstChild;
        while (currChild != NULL){
        	currChildHeight = height(currChild);
        	if (currChildHeight > maxChildHeight){
        		maxChildHeight = currChildHeight;
			}
			currChild = currChild->nextSibling;
		}
		return 1 + maxChildHeight;
    }
    bool IsLeafNode(TreeNode *t){
    	return (t->firstChild == NULL);
	}
	std::vector<int>v;
    int countLeavesNode(TreeNode *t){
    	if (IsLeafNode(t)){
    	v.push_back(t->data);
		return 1;
	}
    	TreeNode *currChild = t->firstChild;
    	int count = 0;
    	while (currChild != NULL){
    		count += countLeavesNode(currChild);
    		currChild = currChild->nextSibling;
		}
		return count;
	}
	std::vector<pair<int,int>>vpi;
	bool visited[MAXN];
	stack<int>st;
	void dfs(TreeNode *t, int cnt){
		int u = t->data;
		visited[u] = true;
 		TreeNode *currChild = t->firstChild;
 		while (currChild != NULL){
 			dfs(currChild,cnt + 1);
 			currChild = currChild->nextSibling;
		}
		vpi.push_back({u,cnt});
		 
	}
	bool cmp(std::pair<int,int>a, std::pair<int,int>b){
			return a.first < b.first;
		}
	int main(int argc,const char** argv){
		int n,x,y,i = 2;
		std::cin>>n>>x>>y;
		TreeNode *t = makeNewNode(y);
		while (i <= n){
		    int u,v;
		    std::cin>>u>>v;
			addNodeIntoTree(t,u,v);
			i++;
		}
		PreOrder(t);
		std::cout<<std::endl<<height(t);
		std::cout<<std::endl<<countLeavesNode(t);
		std::cout<<std::endl;
		for ( auto it = v.begin(); it != v.end() ; it++ ){
			std::cout<<*it<<" ";
		}
		dfs(t,0);
		std::sort(vpi.begin(),vpi.end(),cmp);
		std::cout<<std::endl;
		for ( auto x: vpi ){
			std::cout<<x.first<<" "<<x.second<<std::endl;
		}
		std::cout<<"\n";
		PostOrder(t);
		std::cout<<"\n";
		InOrder(t);
		std::cout<<"\n";
		levelOrder(t);
		return 0;
	}