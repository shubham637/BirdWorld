import 'package:bird_world/Paths/path.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlider(
        onDonePress: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BirdLoginScreen(),
          ),
        ),
        listCustomTabs: [
          FirstIntroScreen(),
          SecondIntroScreen(),
          ThirdIntroScreen(),
        ],
      ),
    );
  }
}
