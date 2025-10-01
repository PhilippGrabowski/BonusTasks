import 'package:bonus_tasks/jp_project/screens/home_screen/home_screen.dart';
import 'package:bonus_tasks/jp_project/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class SplashCard extends StatelessWidget {
  const SplashCard({super.key});

  @override
  Widget build(BuildContext context) {
    Widget btnContent = Text('Order Now', style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 18));

    void navigate() {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    }

    return Column(
      children: [
        Text('Feeling Snackish Today?', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 6),
        Text(
          'Explore Angi\'s most popular snack selection and get instantly happy',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 30),
        CustomButton(
          label: btnContent,
          width: 200,
          height: 50,
          color1: Color.fromARGB(255, 233, 112, 197),
          color2: Color.fromARGB(255, 246, 158, 162),
          action: navigate,
        ),
      ],
    );
  }
}
