import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Gọi ứng dụng Flutter
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contact List App",
      home: ContactList()
    );
  }
}

class Contact{
  final String name;
  final String email;
  final String phone;
  Contact({required this.name, required this.email, required this.phone});
}

class ContactList extends StatelessWidget{
  final List<Contact> contacts = [
    Contact(name: 'Alice', email: 'alice@domain.com', phone: '1234567890'),
    Contact(name: 'Bob', email: 'bob@domain.com', phone: '1234567890'),
    Contact(name: 'Charlie', email: 'charl@domain.com', phone: '1234567890'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
      ),
      body: DataTable(
          columns: const[
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Email")),
            DataColumn(label: Text("Phone"))
          ],
          rows: contacts.map((contact){
            return DataRow(cells: [
              DataCell(Text(contact.name)),
              DataCell(Text(contact.email)),
              DataCell(Text(contact.phone))
            ]);
          }).toList()
      )
    );
  }
}
