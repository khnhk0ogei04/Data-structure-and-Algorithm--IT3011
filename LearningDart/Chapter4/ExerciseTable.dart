import 'package:flutter/material.dart';
// Create a DataTable that displays a list of products with columns Name, Price, and Stock. The DataTable should have 5 rows of products with different names, prices, and stock values.
void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget{
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Product List",
      home: ProductList()
    );
  }
}

class Product{
  final String name;
  final int price;
  final int stock;
  Product({required this.name, required this.price, required this.stock});
}

class ProductList extends StatelessWidget{
  final List<Product> products = [
    Product(name: "Item 1", price: 120, stock: 10),
    Product(name: "Item 2", price: 150, stock: 20),
    Product(name: "Item 3", price: 190, stock: 10),
    Product(name: "Item 4", price: 140, stock: 30),
    Product(name: "Item 5", price: 170, stock: 20),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: Center(
        child: DataTable(
            columns: [
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Price")),
              DataColumn(label: Text("Stock"))
            ],
            rows: products.map((product) {
              return DataRow(
                  cells: [
                    DataCell(Text(product.name)),
                    DataCell(Text(product.stock.toString())),
                    DataCell(Text(product.price.toString()))
                  ]
              );
            }).toList()
          )
      ),
    );
  }
}
