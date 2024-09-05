import 'package:bird_world/Paths/path.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final currentUser = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => BirdLoginScreen(),
        ),
        (route) => false);
  }

  Uri gmailUrl =
      Uri.parse('mailto:test@example.org?subject=Greetings&body=Hello%20World');

  Future<void> _launchUrl() async {
    if (!await launchUrl(gmailUrl)) {
      throw Exception('Could not launch $gmailUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(250),
        ),
        child: SizedBox(
          width: 250,
          child: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    foregroundImage:
                        NetworkImage(currentUser!.photoURL.toString()),
                  ),
                  decoration: BoxDecoration(color: Colors.black87),
                  accountName: TextUtil(
                    text: currentUser!.displayName.toString(),
                    weight: true,
                  ),
                  accountEmail: TextUtil(
                    text: currentUser!.email.toString(),
                    size: 15,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: Icon(Icons.home, size: 26.0, color: Colors.black),
                ),
                ListTile(
                  title: Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                  leading: Icon(Icons.person, size: 26.0, color: Colors.black),
                ),
                ListTile(
                  title: Text(
                    'E-mail us',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  onTap: () {
                    _launchUrl();
                  },
                  leading: Icon(
                    Icons.email,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                Divider(color: Colors.black),
                AboutListTile(
                  applicationVersion: '1.0.0',
                  applicationLegalese: 'Copyright© 2024 DevShubu Applications',
                  applicationName: 'Bird World',
                  applicationIcon: Image(
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                    height: 50,
                    width: 50,
                  ),
                  icon: Icon(
                    Icons.info,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  title: Text(
                    'LogOut',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  onTap: () {
                    AlertDialog alert = AlertDialog(
                        title: Text(
                          'Are you sure, You want to logOut?',
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  signOut();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BirdLoginScreen(),
                                      ),
                                      (route) => false);
                                },
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ]);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  },
                  leading: Icon(Icons.logout, size: 26.0, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
