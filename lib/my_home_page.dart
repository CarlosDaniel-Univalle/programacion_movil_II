import 'package:flutter/material.dart';
import 'menu_option.dart';
import 'card_item.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Map<String, dynamic>> cardData = [
    {
      'designerName': 'David Borg',
      'title': 'Title: Flying Wings',
      'popularity': '2342',
      'likes': '4736',
      'followed': '136',
      'ranking': '1',
      'image': 'assets/images/profile_picture_001.jpg',
      'firstColor': [255, 195, 190, 253],
      'secondColor': [255, 139, 130, 221],
    },
    {
      'designerName': 'Lucy',
      'title': 'Growing up trouble',
      'popularity': '2342',
      'likes': '4736',
      'followed': '136',
      'ranking': '2',
      'image': 'assets/images/profile_picture_002.jpg',
      'firstColor': [255, 235, 172, 101],
      'secondColor': [255, 226, 154, 88],
    },
    {
      'designerName': 'Jerry Cool West',
      'title': "Title: Sculptor's diary",
      'popularity': '2342',
      'likes': '4736',
      'followed': '136',
      'ranking': '3',
      'image': 'assets/images/profile_picture_003.jpg',
      'firstColor': [255, 227, 99, 142],
      'secondColor': [255, 225, 85, 113],
    },
    {
      'designerName': 'Bold',
      'title': 'Title: Illustration of little girl',
      'popularity': '2342',
      'likes': '4736',
      'followed': '136',
      'ranking': '4',
      'image': 'assets/images/profile_picture_004.jpg',
      'firstColor': [255, 196, 114, 230],
      'secondColor': [255, 149, 121, 234],
    },
    {
      'designerName': 'David Borg',
      'title': 'Title: Flying Wings',
      'popularity': '2342',
      'likes': '4736',
      'followed': '136',
      'ranking': '1',
      'image': 'assets/images/profile_picture_005.jpg',
      'firstColor': [255, 102, 221, 198],
      'secondColor': [255, 100, 216, 177],
    },
    {
      'designerName': 'Jerry Cool West',
      'title': "Title: Sculptor's diary",
      'popularity': '2342',
      'likes': '4736',
      'followed': '136',
      'ranking': '3',
      'image': 'assets/images/profile_picture_006.jpg',
      'firstColor': [255, 227, 99, 142],
      'secondColor': [255, 225, 85, 113],
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
                  firstColor: data['firstColor'],
                  secondColor: data['secondColor'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
