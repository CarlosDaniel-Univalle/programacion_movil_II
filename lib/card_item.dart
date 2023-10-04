import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String designerName;
  final String title;
  final String popularity;
  final String likes;
  final String followed;
  final String ranking;
  final String image;
  final List<int> firstColor;
  final List<int> secondColor;

  const CardItem({
    super.key,
    required this.designerName,
    required this.title,
    required this.popularity,
    required this.likes,
    required this.followed,
    required this.ranking,
    required this.image,
    required this.firstColor,
    required this.secondColor,
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
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(
                    firstColor[0], firstColor[1], firstColor[2], firstColor[3]),
                Color.fromARGB(secondColor[0], secondColor[1], secondColor[2],
                    secondColor[3]),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 26,
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100),
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
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _NumberLabel(popularity, "Popularity"),
                          const SizedBox(width: 12),
                          _NumberLabel(likes, "Likes"),
                          const SizedBox(width: 12),
                          _NumberLabel(followed, "Followed"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 28,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.more_horiz, color: Colors.white, size: 40),
                      ],
                    ),
                    const SizedBox(height: 15),
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
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
