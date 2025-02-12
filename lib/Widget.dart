import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  String text;
  Color? color;
  BuildButton({
    super.key,
    required this.text,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(24),
                backgroundColor: color ?? Colors.grey[850],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: Text(
              text,
              style: TextStyle(fontSize: 25, color: Colors.white),
            )),
      ),
    );
  }
}
