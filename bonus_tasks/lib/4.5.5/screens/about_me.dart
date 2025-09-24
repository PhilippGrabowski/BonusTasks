import 'package:bonus_tasks/4.5.5/models/person.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final Person person = Person.example();

    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          backgroundImage: person.imageUrl != null
              ? NetworkImage(person.imageUrl!)
              : null,
          child: person.imageUrl == null
              ? Text(
                  '${person.firstname[0]}${person.lastname[0]}',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                )
              : null,
        ),
        const SizedBox(height: 20),
        Text(
          '${person.firstname} ${person.lastname}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 10),
        Text(person.job, style: TextStyle(fontWeight: FontWeight.w700)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(person.description),
        ),
      ],
    );
  }
}
