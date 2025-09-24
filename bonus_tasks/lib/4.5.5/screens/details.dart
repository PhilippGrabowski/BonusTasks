import 'package:bonus_tasks/4.5.5/models/favorite_place.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key, required place}) : _place = place;

  final FavoritePlace _place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Details')),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                _place.imageUrl,
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color.fromARGB(219, 0, 0, 0),
                      const Color.fromARGB(101, 0, 0, 0),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Text(
                  _place.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            _place.formattedDate,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(_place.description),
          ),
        ],
      ),
    );
  }
}
