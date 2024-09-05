import 'package:bird_world/Paths/path.dart';

class ThirdIntroScreen extends StatelessWidget {
  const ThirdIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/IntroImages/introImg3.jpg'),
            fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(color: Colors.black54),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150, left: 20, right: 25),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: TextUtil(
                text:
                    'Chripy birds give lot of pleasure, always conserve this golden treasure.',
                size: 30,
                color: Colors.white60,
              )),
        ),
      ),
    );
  }
}
