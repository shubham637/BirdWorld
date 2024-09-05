import 'package:bird_world/Paths/path.dart';

class TextUtil extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  bool? weight;
  TextAlign? align;
  TextUtil(
      {super.key,
      required this.text,
      this.size,
      this.color,
      this.weight,
      this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
          wordSpacing: 0,
          color: color ?? Colors.white,
          fontSize: size ?? 18,
          fontWeight: weight == null ? FontWeight.normal : FontWeight.w500),
    );
  }
}
