import 'package:bird_world/Paths/path.dart';

class SecondIntroScreen extends StatelessWidget {
  const SecondIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/IntroImages/introImg2.jpg'),
            fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(color: Colors.black54),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 150,
          ),
          child: Align(
              alignment: Alignment.centerLeft,
              child: TextUtil(
                text:
                    'Birds are indicators of the environment. If they are in trouble, we know we\'ll soon be in trouble.',
                size: 20,
                color: Colors.white60,
              )),
        ),
      ),
    );
  }
}
