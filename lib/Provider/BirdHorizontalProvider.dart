import 'package:bird_world/Paths/path.dart';

class BirdCategoryProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int val) {
    _selectedIndex = val;
    notifyListeners();
  }
}
