import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text, this.textstyle})
      : super(key: key);
  final String text;
  final TextStyle? textstyle;
  @override
  Widget build(BuildContext context) {
    //  print(textstyle);
    return Text(
      text,
      style: textstyle ??
          const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
    );
  }
}

CircleAvatarTest(
    {String? imageUrl,
    String? text,
    double radius = 35,
    Color? backgroundColor}) {
  return CircleAvatar(
    radius: radius,
    child: (text != null)
        ? Center(
            child: Text(text,
                style: const TextStyle(color: Colors.black, fontSize: 14
                    // radius * 2.5 / text.length - 10,
                    )),
          )
        : null,
    foregroundImage: imageUrl == null ? null : NetworkImage(imageUrl),
    backgroundColor: backgroundColor,
    //onForegroundImageError: (e,trace){/*....*/},
  );
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, this.textstyle})
      : super(key: key);
  final String text;
  final TextStyle? textstyle;

  @override
  Widget build(BuildContext context) {
    //  print(textstyle);
    return DottedBorder(
        color: const Color(0xfffcad03),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SizedBox(
            width: 60,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 8,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}

class Star extends StatelessWidget {
  const Star(
      {Key? key,
      required this.star,
      this.count,
      required this.color1,
      this.size})
      : super(key: key);
  final int star;
  final int? count;
  final Color? color1;
  final double? size;

  @override
  Widget build(BuildContext context) {
    //  print(textstyle);
    return Row(
      children: [
        for (var i = 0; i < star; i++)
          Icon(
            Icons.star,
            color: color1,
            size: size ?? 24,
          ),
        count == null
            ? SizedBox()
            : const SizedBox(
                width: 20,
              ),
        count == null
            ? Container()
            : Text(
                '$count',
                style: const TextStyle(fontSize: 14, color: Colors.black),
              )
      ],
    );
  }
}

class Circlebutton extends StatelessWidget {
  const Circlebutton({Key? key, required this.icon1, required this.onpressed})
      : super(key: key);
  final Icon icon1;
  final onpressed;
  @override
  Widget build(BuildContext context) {
    //  print(textstyle);
    return CircleAvatar(
      backgroundColor: Colors.black12,
      radius: 15,
      child: IconButton(
        icon: icon1,
        onPressed: onpressed,
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.icon1,
    required this.text,
    required this.onpressed,
    required this.textstyle,
    // required this.pageIndex,
  }) : super(key: key);
  final Icon icon1;
  final String? text;
  final TextStyle? textstyle;
  // final int pageIndex;
  final onpressed;
  @override
  Widget build(BuildContext context) {
    //  print(textstyle);
    return InkWell(
      onTap: onpressed,
      child: Column(
        children: [
          Expanded(flex: 70, child: icon1),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 29,
            child: Text(
              text!,
              style: textstyle ??
                  const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
