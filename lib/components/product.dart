import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// class Product extends StatelessWidget {
//   final String imageUrl;
//   const Product({super.key, required this.imageUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 250,
//       width: 200,
//       decoration: BoxDecoration(
//         color: Colors.amber,
//         borderRadius: BorderRadius.circular(32),
//       ),
//       child: Column(
//         children: [
//           Image.asset(imageUrl, fit: BoxFit.cover,height: 120,),
//           Text("Apple MacBook pro 2021"),
//           // Spacer(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Icon(Icons.star_rate_outlined),
//               Icon(Icons.star_rate_outlined),
//               Icon(Icons.star_rate_outlined),
//               Icon(Icons.star_rate_outlined),
//               Icon(Icons.star_rate_outlined),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        List<DocumentSnapshot> products = snapshot.data!.docs;

        return GridView.builder(
          itemCount: products.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            Map<String, dynamic> productData =
                products[index].data()! as Map<String, dynamic>;
            // Map<String, dynamic> productData = products[index].data()!;
            String productName = productData['name'];
            String productImage = productData['image'];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffd4ecf7),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {},
                        child: Image.network(
                          productImage,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      productName,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black.withOpacity(.8),
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.star_rate_outlined),
                        Icon(Icons.star_rate_outlined),
                        Icon(Icons.star_rate_outlined),
                        Icon(Icons.star_rate_outlined),
                        Icon(Icons.star_rate_outlined),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
