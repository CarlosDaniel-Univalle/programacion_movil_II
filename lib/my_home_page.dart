import 'package:flutter/material.dart';
import 'menu_option.dart';
import 'card_item.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Map<String, String>> cardData = [
    {
      'designerName': 'Designer 1',
      'title': 'Title 1',
      'popularity': '2342',
      'likes': '4736',
      'followed': '136',
      'ranking': '5',
      'image': 'assets/images/profile_picture_001.jpg',
    },
    {
      'designerName': 'Designer 2',
      'title': 'Title 2',
      'popularity': '1234',
      'likes': '5678',
      'followed': '789',
      'ranking': '3',
      'image': 'assets/images/profile_picture_002.jpg',
    },
    {
      'designerName': 'Designer 3',
      'title': 'Title 3',
      'popularity': '1234',
      'likes': '5678',
      'followed': '789',
      'ranking': '3',
      'image': 'assets/images/profile_picture_003.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          )
        ],
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFD21EE2), Color(0xFF960FD4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFD21EE2), Color(0xFF960FD4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.7),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MenuOption("Designer", isSelected: true),
                MenuOption(
                  "Category",
                  topPadding: 8.0,
                ),
                MenuOption(
                  "Attention",
                  topPadding: 8.0,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount:
                  cardData.length, // Utiliza la cantidad de datos en la lista
              itemBuilder: (context, index) {
                final data =
                    cardData[index]; // Obtiene los datos para este índice
                return CardItem(
                  designerName: data['designerName'] ?? '',
                  title: data['title'] ?? '',
                  popularity: data['popularity'] ?? '',
                  likes: data['likes'] ?? '',
                  followed: data['followed'] ?? '',
                  ranking: data['ranking'] ?? '',
                  image: data['image'] ?? '',
                  // first_color: [255, 195, 190, 253],
                  // second_color: [255, 139, 130, 221],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
