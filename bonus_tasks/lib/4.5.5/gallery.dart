import 'package:bonus_tasks/4.5.5/screens/about_me_screen.dart';
import 'package:bonus_tasks/4.5.5/screens/gallery_list_screen.dart';
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
    Widget content = GalleryListScreen();

    switch (_selectedIndex) {
      case 1:
        content = AboutMeScreen();
        break;
      case 0:
        content = GalleryListScreen();
        break;
      default:
        content = GalleryListScreen();
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
