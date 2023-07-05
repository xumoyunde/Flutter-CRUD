import 'package:flutter/material.dart';

class BestSeller extends StatelessWidget {
  final String imageUrl;
  const BestSeller({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Container(
        width: 100,
        height: 66,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Column(
          children: [
            Image.asset(imageUrl, fit: BoxFit.fill, height: 50,),
            Text("Brand"),
          ],
        ),
      ),
    );
  }
}
