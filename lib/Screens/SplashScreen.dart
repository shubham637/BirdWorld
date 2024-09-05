import 'dart:async';
import 'package:bird_world/Paths/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future checkLogin() async {
    final User? fireabseUser = await FirebaseAuth.instance.currentUser;
    final sharedPref = await SharedPreferences.getInstance();
    bool seen = sharedPref.getBool('seen') ?? false;

    Timer(Duration(seconds: 5), () async {
      if (seen) {
        if (fireabseUser != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LandingScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BirdLoginScreen(),
            ),
          );
        }
      } else {
        await sharedPref.setBool('seen', true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => IntroScreen(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splashImg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        
      )),
    );
  }
}
