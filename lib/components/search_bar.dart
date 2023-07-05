import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        border: Border.all(
          color: const Color(0xff00B4D8),
          width: 1.5,
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.search, size: 25,),
            onPressed: (){},
          ),
          border: InputBorder.none,
          hintText: "Qidirish",
        ),
      ),
    );
  }
}
