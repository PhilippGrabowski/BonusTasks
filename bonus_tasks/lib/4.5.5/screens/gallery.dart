import 'package:bonus_tasks/4.5.5/data/dummy_data.dart';
import 'package:bonus_tasks/4.5.5/screens/about_me.dart';
import 'package:bonus_tasks/4.5.5/screens/details.dart';
import 'package:flutter/material.dart';

const Map<int, String> titles = {0: 'My Gallery', 1: 'About Me'};

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  int _selectedIndex = 0;
  String get title => titles[_selectedIndex]!;

  @override
  Widget build(BuildContext context) {
    Widget content = GalleryList();

    switch (_selectedIndex) {
      case 1:
        content = AboutMe();
        break;
      case 0:
        content = GalleryList();
        break;
      default:
        content = GalleryList();
    }

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(title)),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) =>
            setState(() => _selectedIndex = value),
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.photo_album),
            icon: Icon(Icons.photo_album_outlined),
            label: 'Bilder',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Über mich',
          ),
        ],
      ),
      body: content,
    );
  }
}

class GalleryList extends StatelessWidget {
  const GalleryList({super.key});

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
                  builder: (ctx) => Details(place: favoritePlaces[index]),
                ),
              );
            },
            child: Card(
              child: Column(
                spacing: 15,
                children: [
                  Image.network(
                    favoritePlaces[index].imageUrl,
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
