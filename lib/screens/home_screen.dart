import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/read_data/get_user_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  List<String> docIDs = [];

  // Retrieve document IDs
  Future<void> getDocIds() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .orderBy('age', descending: true)
        .get();

    setState(() {
      docIDs = snapshot.docs.map((document) => document.reference.id).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getDocIds(); // Call the method to retrieve document IDs when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.email!,
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: docIDs.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: docIDs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: GetUserName(documentId: docIDs[index]),
                      tileColor: Colors.grey[200],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
