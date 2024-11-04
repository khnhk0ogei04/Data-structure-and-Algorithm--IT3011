#include<iostream>
#include<vector>
#include <sstream>
#include<string>
#include<set>
#include<map>
#include<stack>
#include<unordered_map>

std::set<std::string> accounts;
std::map<std::string, std::vector<std::tuple<std::string, std::string, int>>> transactions;
// transactions[sender] = {(receiver, timePoint, amount)}
int numberOfTransactions = 0;
int totalMoney = 0;

int totalMoneyFrom(std::string account){
	int ans = 0;
	for (auto it: transactions[account]){
		ans += std::get<2>(it);
	}
	return ans;
}

void inp(){
	while(true){
		std::string sender;
		std::string receiver;
		int amount;
		std::string timePoint;
		std::string atm;
		std::cin>>sender;
		if (sender == "#"){
			std::cin.ignore();
			break;
		}
		std::cin>>receiver;
		std::cin>>amount;
		std::cin>>timePoint;
		std::cin>>atm;
		accounts.insert(sender);
		accounts.insert(receiver);
		std::tuple<std::string, std::string, int> tmp_tuple = std::make_tuple(receiver, timePoint, amount);
		transactions[sender].push_back(tmp_tuple);
		numberOfTransactions += 1;
		totalMoney += amount;														
	}
}

std::vector<std::string> queries;

void query(){
	while (true) {
		std::string query;
		getline(std::cin, query);
		if (query == "#") break;
		queries.push_back(query);
	}
}

int inspectCycle(std::string account, int k){
	std::stack<std::tuple<std::string, std::string, int, std::set<std::string>>> receivers;
	int ans = 0;
	if (!transactions[account].size()){
		return ans;
	}
	for (auto it: transactions[account]){
		std::string receiver = std::get<0>(it);
		std::string timePoint = std::get<1>(it);
		std::set<std::string> st = {receiver};
		receivers.push(std::make_tuple(receiver, timePoint, 1, st));
	}
	while (!receivers.empty()){
		std::tuple<std::string, std::string, int, std::set<std::string>> transaction = receivers.top();
		receivers.pop();
		std::string receiver = std::get<0>(transaction);
		std::string timepoint = std::get<1>(transaction);
        std::set<std::string> visited = std::get<3>(transaction);
        int curr = std::get<2>(transaction);
        if (curr > k){
        	continue;
		}
		if (receiver == account && curr == k){
			ans = 1;
			break;
		}
		for (auto next: transactions[receiver]){
			std::string rc = std::get<0>(next);
			if (visited.find(rc) == visited.end()){
				std::set<std::string> temp = visited;
				temp.insert(rc);
				receivers.push(std::make_tuple(std::get<0>(next), std::get<1>(next), curr + 1, temp));
			}
		}
	}
	return ans;		
}

int main(int argc, const char** argv){
	inp();
	query();
	for (auto qr: queries){
		std::stringstream ss(qr);
		std::string command;
		ss >> command;
		
		if (command == "?list_sorted_accounts"){
			for (std::string account: accounts){
				std::cout<<account<<" ";
			}
			std::cout<<"\n";
			continue;
		}
		
		if (command == "?number_transactions"){
			std::cout<<numberOfTransactions<<"\n";
        	continue;
		}
		if (command == "?total_money_transaction"){
			std::cout<<totalMoney<<"\n";
			continue;
		}
		if (command == "?total_money_transaction_from"){
			std::string account;
			ss >> account;
			std::cout<<totalMoneyFrom(account)<<"\n";
		}
		if (command == "?inspect_cycle"){
			std::string account;
			int k;
			ss >> account;
			ss >> k;
			std::cout<<inspectCycle(account, k)<<"\n";
		}
	}
}

