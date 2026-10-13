import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List',
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: const Color(0xFF607D8B),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: const ContactListPage(),
    );
  }
}

class Contact {
  final String name;
  final String phone;

  const Contact({
    required this.name,
    required this.phone,
  });
}

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  static const Color primaryColor = Color(0xFF607D8B);

  final List<Contact> contacts = const [
    Contact(name: 'Jawad', phone: '01877-777777'),
    Contact(name: 'Ferdous', phone: '01673-777777'),
    Contact(name: 'Hasan', phone: '01745-777777'),
    Contact(name: 'Hasan', phone: '01745-777777'),
    Contact(name: 'Hasan', phone: '01745-777777'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Name input field
              TextFormField(
                initialValue: 'Hasan',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 18,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Phone number input field
              TextFormField(
                initialValue: '01745-777777',
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 18,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Add button (UI only)
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text('Add'),
                ),
              ),

              const SizedBox(height: 30),

              // Contact list
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    elevation: 0,
                    color: const Color(0xFFF1F1F1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      leading: const Icon(
                        Icons.person,
                        size: 36,
                        color: Color(0xFF795548),
                      ),
                      title: Text(
                        contact.name,
                        style: const TextStyle(
                          color: Color(0xFFC96D6D),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        contact.phone,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.call,
                        color: Colors.blue,
                        size: 28,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
