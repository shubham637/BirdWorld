import 'package:bird_world/Paths/path.dart';
import 'package:firebase_database/firebase_database.dart';

class BirdLoginScreen extends StatefulWidget {
  const BirdLoginScreen({super.key});

  @override
  State<BirdLoginScreen> createState() => _BirdLoginScreenState();
}

class _BirdLoginScreenState extends State<BirdLoginScreen> {
  Future<void> googleSignUp() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      if (user != null) {
        final ref = FirebaseDatabase.instance.ref().child('LoginUser');
        final userInputData = UserDataModel(
          name: user.displayName.toString(),
          email: user.email.toString(),
          profilePic: user.photoURL.toString(),
          key: user.uid,
        );

        await ref.child(user.uid).set(userInputData.toMap());
        Fluttertoast.showToast(
            msg: "User Login Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LandingScreen(),
          ),
        );
      } else {
        Fluttertoast.showToast(
            msg: "Login user failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/loginImg.jpg'),
              fit: BoxFit.cover,
              opacity: .3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 200,
            ),
            ElevatedButton(
              onPressed: () async {
                await googleSignUp();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(.2)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/google.png',
                    height: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextUtil(text: 'Sign in with Google')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
