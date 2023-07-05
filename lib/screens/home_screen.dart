import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:login_app/components/product.dart';

import '../components/best_seller.dart';
import '../components/search_bar.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final user = FirebaseAuth.instance.currentUser!;
//   List<String> docIDs = [];
//
//   // Retrieve document IDs
//   Future<void> getDocIds() async {
//     final snapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .orderBy('age', descending: true)
//         .get();
//
//     setState(() {
//       docIDs = snapshot.docs.map((document) => document.reference.id).toList();
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getDocIds(); // Call the method to retrieve document IDs when the widget initializes
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           user.email!,
//           style: TextStyle(fontSize: 16),
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () {
//               FirebaseAuth.instance.signOut();
//             },
//             child: Icon(Icons.logout),
//           )
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: docIDs.isEmpty
//                   ? Center(child: CircularProgressIndicator())
//                   : ListView.builder(
//                 itemCount: docIDs.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ListTile(
//                       title: GetUserName(documentId: docIDs[index]),
//                       tileColor: Colors.grey[200],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    var imageList = [
      "assets/images/1.png",
      "assets/images/2.png",
      "assets/images/3.png",
      "assets/images/4.png",
      "assets/images/5.png",
    ];

    var pNames = [
      "Apple Smartwatch",
      "Red Tshirt",
      "Nike Shoe",
      "Headphones JBL"
    ];

    var pImage = [
      "assets/images/1.png",
      "assets/images/2.png",
      "assets/images/3.png",
      "assets/images/4.png",
      "assets/images/5.png",
      "assets/images/6.png",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        // title: Text(
        //   user.email!,
        //   style: TextStyle(fontSize: 16),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                decoration: BoxDecoration(
                  color: Color(0xff00B4D8),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "O'ZBEKCHA",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: 24),
            ListTile(
              title: Text(user.email.toString()),
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Icon(Icons.person, color: Colors.white,),
              ),
            ),
            ListTile(
              title: Text('To\'lov'),
              leading: Icon(LineIcons.creditCard, size: 30,),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Sevimlilar'),
              leading: Icon(LineIcons.heart, size: 30,),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Yangi kelganlar'),
              leading: Icon(LineIcons.boxOpen, size: 30,),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Yangiliklar'),
              leading: Icon(LineIcons.newspaperAlt, size: 30,),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Biz haqimizda'),
              leading: Icon(LineIcons.exclamationCircle, size: 30,),
              onTap: () {
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Search(),
          ),
          SizedBox(height: 10),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[400],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(top: 36.0, right: 15, left: 15),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < imageList.length; i++)
                            Container(
                              margin: EdgeInsets.only(right: 12),
                              padding: EdgeInsets.only(left: 10),
                              width: 100,
                              height: 66,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    imageList[i],
                                    height: 50,
                                  ),
                                  Text("Brand"),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: 12),

                    Product(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
