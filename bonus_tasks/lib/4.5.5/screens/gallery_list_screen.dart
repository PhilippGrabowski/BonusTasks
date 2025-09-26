import 'package:bonus_tasks/4.5.5/data/dummy_data.dart';
import 'package:bonus_tasks/4.5.5/screens/details_screen.dart';
import 'package:flutter/material.dart';

class GalleryListScreen extends StatelessWidget {
  const GalleryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        ...List.generate(
          favoritePlaces.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => DetailsScreen(place: favoritePlaces[index]),
                ),
              );
            },
            child: Card(
              child: Column(
                spacing: 15,
                children: [
                  Image.network(
                    favoritePlaces[index].imageUrl,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        alignment: Alignment.center,
                        height: 120,
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  Text(favoritePlaces[index].title),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
