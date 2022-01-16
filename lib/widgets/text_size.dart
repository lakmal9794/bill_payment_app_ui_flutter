import 'package:flutter/material.dart';

class SizedText extends StatefulWidget {
  const SizedText({Key? key}) : super(key: key);

  @override
  _SizedTextState createState() => _SizedTextState();
}

class _SizedTextState extends State<SizedText> {
  late String text;
  late Color color;
  late Size textSize = _textSize(text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 16, color: color, fontWeight: FontWeight.w700),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.clip,
          ),
          Row(
            children: [
              for (int i = 0; i < textSize.width / 5; i++)
                i.isEven
                    ? Container(
                        width: 5,
                        color: color,
                        height: 2,
                      )
                    : Container(
                        width: 5,
                        color: Colors.white,
                        height: 2,
                      )
            ],
          )
        ],
      ),
    );
  }

  Size _textSize(String text) {
    late TextPainter textPainter = TextPainter(
      text: TextSpan(
          text: text,
          style: TextStyle(
              fontSize: 16, color: color, fontWeight: FontWeight.w700)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
