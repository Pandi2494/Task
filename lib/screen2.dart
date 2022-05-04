import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:task/main.dart';
import 'common.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var text;
  final controller = CarouselController();

  final List images = [
    '1.jpg',
    '2.jpg',
    '3.jpg',
  ];
  bool viewall = false;
  List card_tile_list = [
    {
      'image': 'assets/1.jpg',
      'model': '0X656565',
      'shopaddress': 'shop address',
      'shopname': 'shop name',
    },
    {
      'image': 'assets/1.jpg',
      'model': '0X656565',
      'shopaddress': 'shop address',
      'shopname': 'shop name',
    },
    {
      'image': 'assets/1.jpg',
      'model': '0X656565',
      'shopaddress': 'shop address',
      'shopname': 'shop name',
    },
    {
      'image': 'assets/1.jpg',
      'model': '0X656565',
      'shopaddress': 'shop address',
      'shopname': 'shop name',
    },
    {
      'image': 'assets/1.jpg',
      'model': '0X656565',
      'shopaddress': 'shop address',
      'shopname': 'shop name',
    },
  ];

  late StreamController initialcontroller;
  StreamSink get initialsink => initialcontroller.sink;
  Stream get initialstream => initialcontroller.stream;

  int pageIndex = 2;
  @override
  void initState() {
    initialcontroller = StreamController.broadcast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40,
              color: const Color(0xfffcad03),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              focusColor: Colors.white,
                              value: text,
                              style: const TextStyle(color: Colors.white),
                              iconEnabledColor: Colors.white,
                              dropdownColor: const Color(0xfffcad03),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 18,
                              ),
                              hint: const Text(
                                'Select Your Location',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              items: <String>[
                                'Chennai',
                                'Coimbatore',
                                'Bangalore',
                                'Hyderabad'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  text = value;
                                });
                              }),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('+91 987456321',
                            style: TextStyle(color: Colors.white, fontSize: 10))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xfffcad03),
                          radius: 18,
                          child: Center(
                            child: IconButton(
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 16,
                              ),
                              onPressed: () {
                                _key.currentState!.openDrawer();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 35,
                          width: 30,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logo.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Circlebutton(
                          icon1: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 15,
                          ),
                          onpressed: () {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Circlebutton(
                          icon1: const Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: 15,
                          ),
                          onpressed: () {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Circlebutton(
                          icon1: const Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 15,
                          ),
                          onpressed: () {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Circlebutton(
                          icon1: const Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                            size: 15,
                          ),
                          onpressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_left,
                        color: Colors.black,
                        size: 15,
                      ),
                      onPressed: () {
                        controller.previousPage(
                            duration: const Duration(milliseconds: 600));
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 80,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 19),
                    child: CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: images.length,
                      options: CarouselOptions(
                        height: 150,
                        initialPage: 0,
                        enlargeCenterPage: true,
                      ),
                      itemBuilder: (context, index, realindex) {
                        final assetimage = images[index];
                        return buildImage(assetimage, index);
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_right,
                        color: Colors.black,
                        size: 15,
                      ),
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 600));
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomDottedLine(
              text: 'Services',
            ),
            const SizedBox(
              height: 10,
            ),
            // const CustomText(
            //   text: 'Services',
            // ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 45,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 7),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/6.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GradientText(
                                'STITCHING ',
                                style: const TextStyle(
                                  fontSize: 12.0,
                                ),
                                gradientType: GradientType.linear,
                                gradientDirection: GradientDirection.ltr,
                                radius: .4,
                                colors: const [
                                  Color(0xff159DFF),
                                  Color(0xff002981),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Expanded(flex: 10, child: SizedBox()),
                  Expanded(
                    flex: 45,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 7),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/7.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GradientText(
                                'EMBROIDERY',
                                style: const TextStyle(
                                  fontSize: 12.0,
                                ),
                                gradientType: GradientType.linear,
                                gradientDirection: GradientDirection.ltr,
                                radius: .4,
                                colors: const [
                                  Color(0xff159DFF),
                                  Color(0xff002981),
                                ],
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
            const SizedBox(
              height: 10,
            ),
            const CustomDottedLine(
              text: 'Active Orders',
            ),
            const SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 140,
              child: ListView.builder(
                  // scrollDirection: Axis.vertical,
                  itemCount: card_tile_list.length,
                  itemBuilder: (BuildContext context, int index) =>
                      card_tile(index)),
            ),
            //  ,
            // card_tile(),
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        viewall = true;
                      },
                      child: const CustomText(
                        text: 'View all',
                        textstyle: TextStyle(color: Colors.blue, fontSize: 12),
                      ))
                ],
              ),
            ),
            const CustomDottedLine(
              text: '103 Shops Near By You',
              textstyle: TextStyle(
                color: Colors.black,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(
                        5,
                      ),
                      child: InkWell(
                        onTap: () {
                          // _controller.jumpToPage(index);
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 60,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        color: Colors.black,
                                      ),
                                      child: Image.asset(
                                        'assets/2.jpg',
                                      )),
                                ),
                                const Expanded(
                                    flex: 12,
                                    child: CustomText(
                                      text: 'Shop Name',
                                      textstyle: TextStyle(fontSize: 10),
                                    )),
                                Expanded(
                                  flex: 12,
                                  child: CustomText(
                                    text: 'Johnson Road , T.Nagar',
                                    textstyle: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 8),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                    flex: 16,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: const [
                                            Star(
                                              star: 3,
                                              color1: Colors.amber,
                                              size: 10,
                                            ),
                                            Star(
                                              star: 2,
                                              color1: Colors.grey,
                                              size: 10,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CustomText(
                                              text: '3.2',
                                              textstyle: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.amber,
                                          size: 14,
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          elevation: 5,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const CustomDottedLine(
              text: 'Recent Order',
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                  // scrollDirection: Axis.vertical,
                  itemCount: card_tile_list.length,
                  itemBuilder: (BuildContext context, int index) =>
                      card_tile(index)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: StreamBuilder(
                stream: initialstream,
                builder: (context, snapshot) {
                  return Row(
                    children: [
                      Expanded(
                          child: pageIndex == 0
                              ? BottomBar(
                                  icon1: const Icon(
                                    Icons.location_searching,
                                    color: Color(0xfffcad03),
                                    size: 22,
                                  ),
                                  onpressed: () {
                                    pageIndex = 0;
                                    initialsink.add('');
                                  },
                                  text: 'Tracking',
                                  textstyle: const TextStyle(
                                      color: Color(0xfffcad03), fontSize: 10),
                                )
                              : BottomBar(
                                  icon1: const Icon(
                                    Icons.location_searching,
                                    color: Colors.black,
                                    size: 22,
                                  ),
                                  onpressed: () {
                                    pageIndex = 0;
                                    initialsink.add('');
                                  },
                                  text: 'Tracking',
                                  textstyle: const TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )),
                      Expanded(
                          child: pageIndex == 1
                              ? BottomBar(
                                  icon1: const Icon(
                                    Icons.notifications_sharp,
                                    color: Color(0xfffcad03),
                                    size: 22,
                                  ),
                                  onpressed: () {
                                    pageIndex = 1;
                                    initialsink.add('');
                                  },
                                  text: 'Notification',
                                  textstyle: const TextStyle(
                                      color: Color(0xfffcad03), fontSize: 10),
                                )
                              : BottomBar(
                                  icon1: const Icon(
                                    Icons.notifications_sharp,
                                    color: Colors.black,
                                    size: 22,
                                  ),
                                  onpressed: () {
                                    pageIndex = 1;
                                    initialsink.add('');
                                  },
                                  text: 'Notification',
                                  textstyle: const TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )),
                      Expanded(
                          child: pageIndex == 2
                              ? BottomBar(
                                  icon1: const Icon(
                                    Icons.home_outlined,
                                    color: Color(0xfffcad03),
                                    size: 22,
                                  ),
                                  onpressed: () {
                                    pageIndex = 2;
                                    initialsink.add('');
                                  },
                                  text: 'Home',
                                  textstyle: const TextStyle(
                                      color: Color(0xfffcad03), fontSize: 10),
                                )
                              : BottomBar(
                                  icon1: const Icon(
                                    Icons.home_outlined,
                                    color: Colors.black,
                                    size: 22,
                                  ),
                                  onpressed: () {
                                    pageIndex = 2;
                                    initialsink.add('');
                                  },
                                  text: 'Home',
                                  textstyle: const TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )),
                      Expanded(
                          child: pageIndex == 3
                              ? BottomBar(
                                  icon1: const Icon(
                                    Icons.chat,
                                    color: Color(0xfffcad03),
                                    size: 22,
                                  ),
                                  onpressed: () {
                                    pageIndex = 3;
                                    initialsink.add('');
                                  },
                                  text: 'Chat',
                                  textstyle: const TextStyle(
                                      color: Color(0xfffcad03), fontSize: 10),
                                )
                              : BottomBar(
                                  icon1: const Icon(
                                    Icons.chat,
                                    color: Colors.black,
                                    size: 22,
                                  ),
                                  onpressed: () {
                                    pageIndex = 3;
                                    initialsink.add('');
                                  },
                                  text: 'Chat',
                                  textstyle: const TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )),
                      Expanded(
                          child: pageIndex == 4
                              ? BottomBar(
                                  icon1: const Icon(
                                    Icons.menu,
                                    color: Color(0xfffcad03),
                                    size: 22,
                                  ),
                                  onpressed: () {
                                    pageIndex = 4;
                                    initialsink.add('');
                                  },
                                  text: 'Menu',
                                  textstyle: const TextStyle(
                                      color: Color(0xfffcad03), fontSize: 10),
                                )
                              : BottomBar(
                                  icon1: const Icon(
                                    Icons.menu,
                                    color: Colors.black,
                                    size: 22,
                                  ),
                                  onpressed: () {
                                    pageIndex = 4;
                                    initialsink.add('');
                                  },
                                  text: 'Menu',
                                  textstyle: const TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )),
                    ],
                  );
                }),
          ),
          elevation: 5,
        ),
      ),
      drawer: drawer(context),
    );
  }

  Padding card_tile(index) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Card(
        child: ListTile(
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(
                Radius.circular(5.0)), //add border radius here
            child: SizedBox(
                height: 40,
                child: Image.asset(card_tile_list[index]['image']
                    .toString())), //add image location here
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 8),
            child: CustomText(text: 'OD2347575'),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Shop Address',
                textstyle: TextStyle(
                    color: Colors.black.withOpacity(0.6), fontSize: 10),
              ),
              CustomText(
                text: 'Shop Name',
                textstyle: TextStyle(
                    color: Colors.black.withOpacity(0.6), fontSize: 10),
              ),
            ],
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: '12-04-2022 ',
                  textstyle: TextStyle(
                      color: Colors.black.withOpacity(0.6), fontSize: 10),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Icon(
                  Icons.location_searching,
                  color: Color(0xfffcad03),
                  size: 18,
                )
              ],
            ),
          ),
        ),
        elevation: 4,
      ),
    );
  }

  Widget buildImage(assetimage, index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.asset(
        assetimage,
        fit: BoxFit.cover,
      ));
}

Drawer drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xfffcad03),
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
          ),
          title: const Text('Page 1'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Task()),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.train,
          ),
          title: const Text('Page 2'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Task()),
            );
          },
        ),
      ],
    ),
  );
}
