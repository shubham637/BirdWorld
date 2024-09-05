import 'package:bird_world/Paths/path.dart';

class FirstIntroScreen extends StatelessWidget {
  const FirstIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/IntroImages/introImg1.jpg'),
            fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(color: Colors.black54),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150, left: 20),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: TextUtil(
                text: 'You can\nnever fly,\nIf you are\nafraid to\njump',
                size: 35,
                color: Colors.white60,
              )),
        ),
      ),
    );
  }
}
