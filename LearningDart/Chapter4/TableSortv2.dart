import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductTableScreen(),
    );
  }
}

class ProductTableScreen extends StatefulWidget {
  const ProductTableScreen({super.key});

  @override
  State<ProductTableScreen> createState() => _ProductTableScreenState();
}

class _ProductTableScreenState extends State<ProductTableScreen> {
  List<Map<String, dynamic>> products = [
    {"name": "Laptop", "price": 1200.00, "quantity": 5},
    {"name": "Phone", "price": 800.00, "quantity": 10},
    {"name": "Headphones", "price": 150.00, "quantity": 20},
    {"name": "Mouse", "price": 50.00, "quantity": 15},
    {"name": "Keyboard", "price": 70.00, "quantity": 12},
  ];
  int _sortColumnIndex = 0;
  bool _isAscending = true;

  void _sortTable(int columnIndex, String key){
    setState(() {
      _isAscending = (_sortColumnIndex == columnIndex) ? !_isAscending : true;
      _sortColumnIndex = columnIndex;
      products.sort((a, b) => _isAscending
        ? a[key].compareTo(b[key]) : b[key].compareTo(a[key])
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TABLE PRODUCTS"),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _isAscending,
          columns: [
            _buildColumn("Product Name", 0, "name"),
            _buildColumn("Price (\$)", 1, "price", numeric: true),
            _buildColumn("Quantity", 2, "quantity", numeric: true),
          ],
          rows: products.map((product) => DataRow(
            cells: [
              DataCell(
                  Text(product["name"])
              ),
              DataCell(
                Text("${product["price"]}")
              ),
              DataCell(
                Text("${product["quantity"]}")
              )
            ]
          )).toList()
        ),
      )
    );
  }

  DataColumn _buildColumn(String label, int index, String key, {bool numeric = false}){
    return DataColumn(
        label: Text(label),
        numeric: numeric,
        onSort: (columnIndex, int) => _sortTable(columnIndex, key)
    );
  }

}
