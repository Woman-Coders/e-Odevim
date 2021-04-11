import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({this.title, this.colour, @required this.onTap});

  final Color colour;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: InkWell(
        onTap: onTap,
        child: Container(
            color: colour,
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
            )),
      ),
    );
  }
}
