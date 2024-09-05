import 'package:bird_world/Paths/path.dart';

class BirdDetialsScreen extends StatefulWidget {
  String image;
  String name;
  String ageAndHeight;
  String? detial;
  BirdDetialsScreen({
    super.key,
    required this.image,
    required this.name,
    required this.ageAndHeight,
    this.detial,
  });

  @override
  State<BirdDetialsScreen> createState() => _BirdDetialsScreenState();
}

class _BirdDetialsScreenState extends State<BirdDetialsScreen> {
  Uri gmailUrl =
      Uri.parse('mailto:test@example.org?subject=Greetings&body=Hello%20World');

  Future<void> _launchUrl() async {
    if (!await launchUrl(gmailUrl)) {
      throw Exception('Could not launch $gmailUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    final String birdName = widget.name;
    final String birdAgeAndHeight = widget.ageAndHeight;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.image),
            fit: BoxFit.cover,
            opacity: .1,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white24,
                            offset: Offset(5, 5),
                            blurRadius: 20)
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: Colors.white54,
                    endIndent: 10,
                  )),
                  TextUtil(
                    text: 'More Details',
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10,
                      color: Colors.white54,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  padding: EdgeInsets.only(left: 20, top: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(-5, -5),
                            blurRadius: 20)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtil(
                        text: 'Name   : -  ${birdName}',
                        color: Colors.white60,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextUtil(
                        text: 'Age       : -  ${birdAgeAndHeight}',
                        color: Colors.white60,
                      ),
                      Divider(
                        height: 30,
                        color: Colors.white30,
                      ),
                      Text(
                        'Species',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 20, top: 10, bottom: 10),
                          child: Text(
                            widget.detial.toString(),
                            maxLines: 7,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.white60, fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => _launchUrl(),
                          child: Container(
                            padding: EdgeInsets.only(right: 30),
                            margin: EdgeInsets.only(bottom: 20),
                            alignment: Alignment.centerRight,
                            color: Colors.black38,
                            height: 50,
                            width: 300,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextUtil(
                                  text: 'Connect with Us',
                                  weight: true,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.chat,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
