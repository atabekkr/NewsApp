import 'package:flutter/material.dart';

class MyDrawerBody extends StatefulWidget {
  const MyDrawerBody({super.key});

  @override
  State<MyDrawerBody> createState() => _MyDrawerBodyState();
}

class _MyDrawerBodyState extends State<MyDrawerBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          category("So'ngi yangiliklar"),
          category("Mahalliy"),
          category("Dunyo"),
          category("Texnologiyalar"),
          const Divider(thickness: 1.0),
          Padding(
              padding: const EdgeInsets.only(top: 16), child:
          category("Tanlangan xabarlar", Colors.green)),
          const Divider(thickness: 1.0),
          category("Madaniyat"),
          category("Avto"),
          category("Sport"),
          category("Foto")
        ],
      ),
    );
  }

  Widget category(String title, [Color givenColor = Colors.black]) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(left: 18),
      child: Text(title,
          style: TextStyle(
              color: givenColor, fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }
}
