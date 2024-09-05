import 'Paths/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const BirdWorld());
}

class BirdWorld extends StatefulWidget {
  const BirdWorld({super.key});
  @override
  State<BirdWorld> createState() => _BirdWorldState();
}

class _BirdWorldState extends State<BirdWorld> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BirdCategoryProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Bird World',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
