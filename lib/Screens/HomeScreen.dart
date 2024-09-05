import 'package:bird_world/Paths/path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -80,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrange,
                    blurRadius: 200,
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffd25716),
                      blurRadius: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            right: -20,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrange,
                    blurRadius: 200,
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffd25716),
                      blurRadius: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.flutter_dash,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextUtil(
                          text: 'Bird World',
                          size: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_scaffoldKey.currentState!.isDrawerOpen) {
                            _scaffoldKey.currentState!.openEndDrawer();
                          } else {
                            _scaffoldKey.currentState!.openDrawer();
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                          ),
                          child: Icon(
                            Icons.notes,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      TextUtil(
                        text: 'Welcome ',
                        color: Colors.white54,
                        size: 20,
                      ),
                      TextUtil(
                        text: currentUser!.displayName.toString(),
                        size: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextUtil(
                    text: 'What would you like to learn about?',
                    size: 25,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 35,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) {
                          return Consumer<BirdCategoryProvider>(
                              builder: (context, birdCategoryList, child) {
                            return GestureDetector(
                              onTap: () => birdCategoryList.changeIndex(index),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                margin: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white54,
                                  ),
                                  borderRadius: BorderRadius.circular(120),
                                  color: birdCategoryList.selectedIndex == index
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                                alignment: Alignment.center,
                                child: TextUtil(
                                  text: categoryList[index],
                                  weight: true,
                                  color: birdCategoryList.selectedIndex == index
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            );
                          });
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: birdDataList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BirdDetialsScreen(
                                  image: birdDataList[index].image,
                                  name: birdDataList[index].name,
                                  ageAndHeight: birdDataList[index].age,
                                  detial: birdDetialList[index].detials,
                                ),
                              ),
                            ),
                            child: Container(
                              width: 120,
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff1a1a1a),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            birdDataList[index].image),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextUtil(
                                            text: birdDataList[index].name,
                                            size: 14,
                                            weight: true,
                                          ),
                                          TextUtil(
                                            text: birdDataList[index].age,
                                            size: 11,
                                            weight: true,
                                            color: Colors.grey,
                                          ),
                                          TextUtil(
                                            text: "+Know More",
                                            size: 14,
                                            weight: true,
                                            color: Colors.orange,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: birdVerticallyList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BirdDetialsScreen(
                                image: birdVerticallyList[index].image,
                                name: birdVerticallyList[index].name,
                                ageAndHeight: birdVerticallyList[index].age,
                                detial: birdVertDetialList[index].detials,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                height: 100,
                                width: 100,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                  birdVerticallyList[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: TextUtil(
                                    text: birdVerticallyList[index].name,
                                  ),
                                  subtitle: TextUtil(
                                    text: birdVerticallyList[index].age,
                                    size: 15,
                                    color: Colors.white70,
                                  ),
                                  trailing: Icon(
                                    Icons.more_vert,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
