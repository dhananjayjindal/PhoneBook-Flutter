import 'export.dart';

class Contacts {
  Contacts({required this.name, required this.phone});
  final String name;
  final String phone;
}

class ViewContacts extends StatelessWidget {
  const ViewContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Contacts"),
      ),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: contacts.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.

        itemBuilder: (context, index) {
          final item = contacts[index];

          return ListTile(
            
            title: Text(item['name']!),
            subtitle: Text(item['phone']!),
          );
        },
      ),
    );
  }
}
