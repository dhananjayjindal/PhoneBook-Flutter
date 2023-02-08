import 'export.dart';

class Contacts {
  Contacts({required this.name, required this.phone});
  final String name;
  final String phone;
}

class ViewContacts extends StatefulWidget {
  const ViewContacts({super.key});

  @override
  State<ViewContacts> createState() => _ViewContactsState();
}

class _ViewContactsState extends State<ViewContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Contacts"),
      ),
      
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('contacts').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((item) {
              return ListTile(
                title: Text(item['name']!),
                subtitle: Text(item['phone']!),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
