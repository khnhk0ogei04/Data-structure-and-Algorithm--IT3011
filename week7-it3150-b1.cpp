#include<bits/stdc++.h>
#define MAXN 100005
using namespace std;
std::unordered_map<std::string,std::map<std::string,int>>shopOrders;
std::unordered_map<std::string,int>shopRevenue;
int totalRevenue = 0;
int totalNumberOrders = 0;
std::vector<int>answer;
int profit[MAXN];
int convert(std::string time){
	std::vector<std::string>t;
	std::string tmp = "";
	for (int i = 0 ; i < time.length() ; i++){
	    if (time[i] != ':') tmp += time[i];
	    else {
	        t.push_back(tmp);
	        tmp = "";
	    }
	}
	t.push_back(tmp);
	return (stoi(t[0])) * 3600 + stoi(t[1]) * 60 + stoi(t[2]);
}
void inp(){
    fill(profit,profit + MAXN, 0);
	while (1){
		std::string customerID;
		std::string productID;
		int price;
		std::string shopID;
		std::string timePoint;
		std::cin>>customerID;
		if (customerID == "#"){
			break;
		}
		std::cin>>productID;
		std::cin>>price;
		std::cin>>shopID;
		std::cin>>timePoint;
		totalNumberOrders += 1;
		totalRevenue += price;
		profit[convert(timePoint)] += price;
		if (shopRevenue.find(shopID) == shopRevenue.end()){
			shopRevenue.insert({shopID,price});
		}
		else shopRevenue[shopID] += price;
		if (shopOrders.find(shopID) == shopOrders.end()){
			map<string,int>mp;
			shopOrders.insert({shopID,mp});
		}
		if (shopOrders[shopID].find(customerID) == shopOrders[shopID].end()){
			shopOrders[shopID].insert({customerID,price});
		}
		else shopOrders[shopID][customerID] += price;
	}
	    int cur = profit[0];
		for (int i = 1 ; i <= 100000 ; i++){
			cur += profit[i];
			profit[i] = cur;
		}
}
void getAnswer(){
	std::string query;
	while(std::cin>>query){
	if (query == "#"){
		break;
	}
	if (query == "?total_numbers_orders"){
		answer.push_back(totalNumberOrders);
		continue;
	}
	if (query == "?total_revenue"){
		answer.push_back(totalRevenue);
		continue;
	}
	if (query == "?revenue_of_shop"){
		std::string temp;
		std::cin>>temp;
		answer.push_back(shopRevenue[temp]);
		continue;
	}
	if (query == "?total_consume_of_customer_shop"){
		std::string temp1,temp2;
		std::cin>>temp1;
		std::cin>>temp2;
		answer.push_back(shopOrders[temp2][temp1]);
		continue;
	}
	if (query == "?total_revenue_in_period"){
		std::string temp1;
		std::string temp2;
		std::cin>>temp1>>temp2;
		int res = profit[convert(temp2)] - profit[convert(temp1)];
		answer.push_back(res);
		continue;
	}
}
	for (auto it = answer.begin() ; it != answer.end() ; it++ ){
		std::cout<<*it<<" ";
	}
}
int main(int argc, const char** argv){
	std::ios_base::sync_with_stdio(false);
	std::cin.tie(NULL);
//	std::cout.tie(NULL);
	inp();
	getAnswer();
	return 0;
}
/*C001 P001 10 SHOP001 10:30:10
C001 P002 30 SHOP001 12:30:10
C003 P001 40 SHOP002 10:15:20
C001 P001 80 SHOP002 08:40:10
C002 P001 130 SHOP001 10:30:10
C002 P001 160 SHOP003 11:30:20
#
?total_numbers_orders
?total_revenue
?revenue_of_shop SHOP001
?total_consume_of_customer_shop C001 SHOP001
?total_revenue_in_period 10:00:00 18:40:45 
6 450 170 40 370 */
