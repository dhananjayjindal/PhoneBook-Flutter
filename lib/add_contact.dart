import 'export.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final nameController = TextEditingController();
  final contactNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference contacts =
        FirebaseFirestore.instance.collection("contacts");
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),

            // Name Entry
            TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Enter Name",
              ),
            ),

            // Contact Number Entry
            TextField(
              controller: contactNumberController,
              keyboardType: TextInputType.phone,
              decoration:
                  const InputDecoration(labelText: "Enter Contact Number"),
            ),

            SizedBox(
              height: height * 0.1,
            ),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    contactNumberController.text.isEmpty) {
                  const SnackBar(
                    content: Text("Details missing"),
                  );
                } else {
                  contacts
                      .add({
                        "name": nameController.text,
                        "phone": contactNumberController.text,
                      })
                      .then((value) => const SnackBar(
                            content: Text("Contact Added"),
                          ))
                      .catchError((error) => const SnackBar(
                            content: Text("Error Adding Contact"),
                          ));
                  Navigator.pop(context);
                }
              },
              child: const Text("ADD"),
            ),
          ],
        ),
      ),
    );
  }
}
