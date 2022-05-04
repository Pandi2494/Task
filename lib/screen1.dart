import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:task/common.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late double _rating;

  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isVertical = false;

  IconData? _selectedIcon;
  @override
  void initState() {
    // TODO: implement initState
    _rating = _initialRating;
    super.initState();
  }

  late double _width;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/1.jpg'), fit: BoxFit.cover),
                ),
              ),
              service_container(),
              DottedLine(
                dashColor: Colors.black.withOpacity(0.2),
              ),
              category_container(),
              DottedLine(
                dashColor: Colors.black.withOpacity(0.2),
              ),
              benefits_container(),
              DottedLine(
                dashColor: Colors.black.withOpacity(0.2),
              ),
              description_container(),
              DottedLine(
                dashColor: Colors.black.withOpacity(0.2),
              ),
              ratings_comments(),
              name_avatar(),
              Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomText(
                            text:
                                'lorem ipsum is simplt dummy test of the printing and typecasting',
                            textstyle: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 10)),
                      )
                    ],
                  ))
            ],
          ),
          Positioned(
              top: 180,
              right: 10,
              left: 10,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment
                        .centerRight, // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      Color(0xfffcdb03),
                      Color(0xfffcad03)
                    ], // red to yellow
                    // tileMode: TileMode
                    //     .repeated, // repeats the gradient over the canvas
                  ),
                ),
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.store,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CustomText(
                                  text: 'Shop Name',
                                  textstyle: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CustomText(
                                  text: 'Johnson Road, T.Nagar',
                                  textstyle: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const DottedLine(
                      dashColor: Colors.white,
                      direction: Axis.vertical,
                    ),
                    const Expanded(
                        flex: 15,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 25,
                        )),
                    const DottedLine(
                      dashColor: Colors.white,
                      direction: Axis.vertical,
                    ),
                    const Expanded(
                        flex: 15,
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 25,
                        )),
                  ],
                ),
                // child: ,
              )),
          Positioned(
            top: 15,
            left: 5,
            child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.yellow,
                  ),
                  height: 30,
                  width: 30,
                  child: const Icon(Icons.keyboard_arrow_left),
                )),
          ),
        ],
      ),
    );
  }

  Padding name_avatar() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatarTest(
                  backgroundColor: Colors.blue, text: 'JW', radius: 15),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'John Williamson',
                    textstyle: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                  Row(
                    children: const [
                      Star(
                        star: 3,
                        color1: Colors.amber,
                        size: 14,
                      ),
                      Star(
                        star: 2,
                        color1: Colors.grey,
                        size: 14,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          CustomText(
            text: 'June 5 ,2022',
            textstyle:
                TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 10),
          )
        ],
      ),
    );
  }

  Padding ratings_comments() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Rating & Comments',
            textstyle: TextStyle(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 65,
                  child: Column(
                    children: const [
                      Star(
                        count: 16,
                        star: 5,
                        color1: Colors.amber,
                      ),
                      Star(
                        count: 08,
                        star: 4,
                        color1: Colors.amber,
                      ),
                      Star(
                        count: 06,
                        star: 3,
                        color1: Colors.amber,
                      ),
                      Star(
                        count: 02,
                        star: 2,
                        color1: Colors.amber,
                      ),
                      Star(
                        count: 01,
                        star: 1,
                        color1: Colors.amber,
                      )
                    ],
                  )),
              Expanded(
                flex: 35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    CustomText(
                      text: '4.3',
                      textstyle: TextStyle(
                          color: Color(0xff00b359),
                          fontSize: 32,
                          fontWeight: FontWeight.w900),
                    ),
                    CustomText(
                      text: '54 Rating',
                      textstyle: TextStyle(
                        color: Color(0xff00b359),
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                child: Container(
                  // margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.edit,
                        size: 14,
                        color: Colors.orange,
                      ),
                      CustomText(
                        text: 'Write a Review',
                        textstyle:
                            TextStyle(color: Colors.orange, fontSize: 10),
                      )
                    ],
                  ),
                ),
                onPressed: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              const CustomText(
                text: 'Reviews (12)',
                textstyle: TextStyle(color: Colors.black, fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }

  Padding description_container() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Description',
            textstyle: TextStyle(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  "Lorem ipsum is simply dummy text pf the printing and typesetting industry.Lorem ipsum has been the industry's standard dummy text ever since the 1500s,whwn an unknown printer tool a galley of type and scrambled it to make a type specimen book. it has survived not only five centuries,but also the leap into electronic typesetting.",
                  style: TextStyle(
                      fontSize: 10, color: Colors.black.withOpacity(0.8)),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Padding benefits_container() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Row(
        children: [
          Expanded(
            flex: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Benefits',
                  textstyle: TextStyle(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'Material Pickup & Delivery Available',
                      textstyle: TextStyle(
                          fontSize: 10, color: Colors.black.withOpacity(0.8)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const Expanded(
              flex: 10,
              child: Icon(
                Icons.message,
                color: Color(0xfffcad03),
              )),
        ],
      ),
    );
  }

  Padding category_container() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Row(
        children: [
          Expanded(
            flex: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Category',
                  textstyle: TextStyle(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CustomButton(
                      text: 'Men',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomButton(
                      text: 'Women',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomButton(
                      text: 'Kids',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const Expanded(
              flex: 10,
              child: Icon(
                Icons.call,
                color: Colors.green,
              )),
        ],
      ),
    );
  }

  Padding service_container() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Services',
            textstyle: TextStyle(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: _width < 350 ? 65 : 50,
                  child: Row(
                    children: const [
                      CustomButton(
                        text: 'Stitching',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomButton(
                        text: 'Embroidery',
                      ),
                    ],
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: _width < 350 ? 35 : 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _ratingBar(_ratingBarMode),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '$_rating',
                        style: TextStyle(fontSize: _width < 350 ? 12 : 16),
                      ),
                    ],
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _ratingBar(int mode) {
    return RatingBar.builder(
      initialRating: _initialRating,
      minRating: 1,
      direction: _isVertical ? Axis.vertical : Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.grey,
      itemCount: 5,
      itemSize: _width < 350 ? 12 : 20.0,
      // itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => Icon(
        _selectedIcon ?? Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
        });
      },
      updateOnDrag: true,
    );
  }
}
