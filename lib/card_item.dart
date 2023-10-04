import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String designerName;
  final String title;
  final String popularity;
  final String likes;
  final String followed;
  final String ranking;
  final String image;
  // final List<int> first_color = [];
  // final List<int> second_color = [];

  CardItem({
    super.key,
    required this.designerName,
    required this.title,
    required this.popularity,
    required this.likes,
    required this.followed,
    required this.ranking,
    required this.image,
    // required List<int> first_color,
    // required List<int> second_color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
        shadowColor: const Color.fromARGB(255, 30, 87, 145).withOpacity(0.7),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 195, 190, 253),
                Color.fromARGB(255, 139, 130, 221)
                // Color.fromARGB(first_color[0], first_color[1], first_color[2],
                //     first_color[3]),
                // Color.fromARGB(second_color[0], second_color[1],
                //     second_color[2], second_color[3])
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 12,
                left: 12,
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      designerName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _NumberLabel(popularity, "Popularity"),
                          SizedBox(width: 18),
                          _NumberLabel(likes, "Likes"),
                          SizedBox(width: 18),
                          _NumberLabel(followed, "Followed"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 30,
                right: 12,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.circle, color: Colors.white, size: 5),
                        SizedBox(width: 3),
                        Icon(Icons.circle, color: Colors.white, size: 5),
                        SizedBox(width: 3),
                        Icon(Icons.circle, color: Colors.white, size: 5),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      ranking,
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    const Text(
                      "Ranking",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -3,
                bottom: -38,
                right: -5,
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(140),
                      bottomLeft: Radius.circular(100),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NumberLabel extends StatelessWidget {
  final String number;
  final String label;

  const _NumberLabel(this.number, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
