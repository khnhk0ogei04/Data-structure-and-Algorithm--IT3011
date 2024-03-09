#include<bits/stdc++.h>
#include<iostream>
#define MAXN 100001
using namespace std;
int number_people = 0;
int max_unrelated_people = 0;
int number_people_alive = 0;
std::unordered_map<std::string,std::tuple<std::string,std::string,std::string,char,std::string>>people;
std::map<std::string,std::string> parent;
std::map<std::string,int>people_born_at;
std::map<std::string,int>number_of_people_born;
std::set<std::string>roots;
std::map<std::string,std::vector<std::string>>Trees;

int LISS(std::string root){
	if (Trees[root].size() == 0){
		return 1;
	}
	int sum1 = 0;
	for (auto child: Trees[root]){
		sum1 += LISS(child);
	}
	int sum2 = 2;
	for (auto child: Trees[root]){
		for (auto grandChild: Trees[child]){
			sum2 += LISS(grandChild);
		}
	}
	return std::max(sum1,sum2);
}
int mostAliveAncestor(std::string personCode){
	int dist = 0;
	std::queue<std::pair<std::string,int>>q;
	q.push({personCode,0});
	while (!q.empty()){
		std::pair<std::string,int> p = q.front();
		q.pop();
		if (parent.find(p.first) == parent.end()){
			dist = p.second;
			break;
		}
		else q.push({parent[p.first],p.second + 1});
	}
	return dist;
}
void inp(){
	std::string code;
	while (std::cin>>code){
		if (code == "#"){
			break;
		}
		std::string date_of_birth;
		std::string father_code;
		std::string mother_code;
		char is_alive;
		std::string region_code;
		std::cin>>date_of_birth;
		std::cin>>father_code;
		std::cin>>mother_code;
		std::cin>>is_alive;
		std::cin>>region_code;
		tuple<string,string,string,char,string> tmp;
		tmp = make_tuple(date_of_birth,father_code,mother_code,is_alive,region_code);
		people.insert({code,tmp});
		number_people += 1;
		if (is_alive == 'Y') number_people_alive += 1;
		else number_people_alive += 0;
		if (people_born_at.find(date_of_birth) == people_born_at.end()){
			people_born_at.insert({date_of_birth,0});
			number_of_people_born.insert({date_of_birth,0});
			}
		people_born_at[date_of_birth] += 1;
		number_of_people_born[date_of_birth] += 1;
		if (mother_code == "0000000" && father_code == "0000000"){
			roots.insert(code);
			continue;
		}
		if (father_code != "0000000"){
			Trees[father_code].push_back(code);
			roots.erase(mother_code);
		}
		else if (mother_code != "0000000"){
			Trees[mother_code].push_back(code);
			roots.erase(father_code);
		}
	}
}
	int main(){
	inp();
	for (auto person: people){
		std::string fatherCode = get<1>(person.second);
		if (people.find(fatherCode) != people.end()){
			parent[person.first] = fatherCode;
		}
	}
	int temp = 0;
	for (auto it: number_of_people_born){
		temp += it.second;
		number_of_people_born[it.first] = temp;
	}
	for (auto root: roots){
		max_unrelated_people += LISS(root);
	}
	std::string query;
	while (std::cin>>query){
		if (query == "###") {
			break;
		}
		if (query == "NUMBER_PEOPLE"){
			std::cout<<number_people;
			continue;
		}
		if (query == "NUMBER_PEOPLE_ALIVE"){
			std::cout<<number_people_alive;
			continue;
		}
		if (query == "NUMBER_PEOPLE_BORN_AT"){
			std::string tmp;
			std::cin>>tmp;
			std::cout<<people_born_at[tmp];
			continue;
		}
		if (query == "MAX_UNRELATED_PEOPLE"){
			std::cout<<max_unrelated_people;
			continue;
		}
		if (query == "MOST_ALIVE_ANCESTOR"){
			std::string tmp;
			std::cin>>tmp;
			std::cout<<mostAliveAncestor(tmp);
			continue;
		}
		if (query == "NUMBER_PEOPLE_BORN_BETWEEN"){
			std::string tmp1,tmp2;
			std::cin>>tmp1>>tmp2;
			int left = 0,right = 0;
			auto it_low = number_of_people_born.lower_bound(tmp1);
			if (it_low != number_of_people_born.begin()){
				it_low--;
				left = it_low->second;
			}
			auto it_high = number_of_people_born.upper_bound(tmp2);
			it_high--;
			right = it_high->second;
			std::cout<<right - left;
			continue;
		}
	}
	return 0;
}
/*0000001 1920-08-10 0000000 0000000 Y 00002
0000002 1920-11-03 0000000 0000000 Y 00003
0000003 1948-02-13 0000001 0000002 Y 00005
0000004 1946-01-16 0000001 0000002 Y 00005
0000005 1920-11-27 0000000 0000000 Y 00005
0000006 1920-02-29 0000000 0000000 Y 00004
0000007 1948-07-18 0000005 0000006 Y 00005
0000008 1948-07-18 0000005 0000006 Y 00002
0000009 1920-03-09 0000000 0000000 Y 00005
0000010 1920-10-16 0000000 0000000 Y 00005
#
NUMBER_PEOPLE_BORN_BETWEEN 1900-12-19 1948-11-16
10
NUMBER_PEOPLE_BORN_BETWEEN 1900-12-19 1928-11-16
6
NUMBER_PEOPLE_BORN_BETWEEN 1944-08-13 1977-12-15
4
NUMBER_PEOPLE_BORN_BETWEEN 1987-01-24 1988-06-03
0
MOST_ALIVE_ANCESTOR
0000008
1
MAX_UNRELATED_PEOPLE
6
NUMBER_PEOPLE
10
NUMBER_PEOPLE_ALIVE
10
NUMBER_PEOPLE_BORN_AT 1948-07-18
2 */
