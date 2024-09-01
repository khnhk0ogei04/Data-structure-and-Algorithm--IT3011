#include<iostream>
#include<stdlib.h>

class Fraction{
	private:
		int numerator, denominator;
	public:
		int getNumerator();
		int getDenominator();
		void setNumerator(int num);
		void setDenominator(int denom);
		void input();
		void output();
		
		void simplify();
		
		Fraction operator+(Fraction);
		Fraction operator-(Fraction);
		Fraction operator*(Fraction);
		Fraction operator/(Fraction);
};
		void getTotalOf(Fraction, Fraction);
		void getSubtractionOf(Fraction, Fraction);
		void getMultiplicationOf(Fraction, Fraction);
		void getDivisionOf(Fraction, Fraction);
		
		void print(Fraction& );
		
		int main(){
			Fraction a, b;
			std::cout<<"Nhap phan so thu nhat: "<<std::endl;
			a.input();
			std::cout << "Nhap phan so thu hai" <<std::endl;
			b.input();
		
			getTotalOf(a, b);
			getSubtractionOf(a, b);
			getMultiplicationOf(a, b);
			getDivisionOf(a, b);
		
			std::cout <<std::endl;
			return 0;
			
		}
		void Fraction::input(){
			std::cout<<"Nhap tu so: ";
			std::cin>>numerator;
			std::cout<<"Nhap mau so: ";
			std::cin>>denominator;
			while (denominator == 0){
				std::cout<<"Mau so phai khac 0. \n Mau so moi la: ";
				std::cin>>denominator;
			}
		}
		
		int Fraction::getNumerator(){
			return numerator;
		}
		
		int Fraction::getDenominator(){
			return denominator;
		}
		
		void Fraction::setNumerator(int num){
			numerator = num;
		}
		void Fraction::setDenominator(int denom){
			if (denom == 0){
				std::cout << "Mau so phai khac 0. Mau so duoc thiet lap thanh 1." << std::endl;
        		denominator = 1;
			} else {
				denominator = denom;
			}		
		}
		
		void Fraction::output(){
			if (numerator % denominator == 0)
				std::cout << numerator / denominator;
			else 
				std::cout<<numerator << " / "<<denominator<<std::endl;
		}
		
		void Fraction::simplify(){
			for (int i = numerator; i >= 1; i--){
				if (numerator % i == 0 && denominator % i == 0){
					numerator /= i;
					denominator /= i;
					if ((numerator < 0 && denominator < 0) || (numerator > 0 && denominator < 0)) {
						numerator *= -1;
						denominator *= -1;
					}
					break;
				}
			}
		}
		
		Fraction Fraction::operator+(Fraction x){
			Fraction temp;
			temp.numerator = numerator * x.denominator + x.numerator * denominator;
			temp.denominator = x.denominator * denominator;
			temp.simplify();
			return temp;
		}
		
		Fraction Fraction::operator-(Fraction x){
			Fraction temp;
			temp.numerator = numerator * x.denominator - x.numerator * denominator;
			temp.denominator = x.denominator * denominator;
			temp.simplify();
			return temp;
			
		}
		Fraction Fraction::operator*(Fraction x) {
			Fraction temp;
			temp.numerator = numerator * x.numerator;
			temp.denominator = x.denominator * denominator;
			temp.simplify();
			return temp;
		}
		Fraction Fraction::operator/(Fraction x) {
			Fraction temp;
			temp.numerator = numerator * x.denominator;
			temp.denominator = x.numerator * denominator;
			temp.simplify();
			return temp;
		}
		
		void getTotalOf(Fraction x, Fraction y){
			std::cout<<"Tong cua 2 phan so la: ";
			Fraction fraction = x + y;
			fraction.output();
		}
		void getSubtractionOf(Fraction x, Fraction y){
			std::cout<<"Hieu cua 2 phan so la: ";
			Fraction fraction = x - y;
			fraction.output();
		}
		void getMultiplicationOf(Fraction x, Fraction y){
			std::cout<<"Tich cua 2 phan so la: ";
			Fraction fraction = x * y;
			fraction.output();
		}
		void getDivisionOf(Fraction x, Fraction y){
			std::cout<<"Thuong cua 2 phan so la: ";
			if (y.getNumerator() == 0){
				std::cout<<"Khong ton tai phan so "<<std::endl;
			} else {
				Fraction div = x / y;
				div.output();
			}
		}
		
/*
Nhap phan so thu nhat:
Nhap tu so: 20
Nhap mau so: 30
Nhap phan so thu hai
Nhap tu so: 15
Nhap mau so: 25
Tong cua 2 phan so la: 19 / 15
Hieu cua 2 phan so la: 1 / 15
Tich cua 2 phan so la: 2 / 5
Thuong cua 2 phan so la: 10 / 9
*/
