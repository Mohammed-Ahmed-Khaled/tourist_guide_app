import 'package:flutter/material.dart';

class Governmentcard extends StatefulWidget {
  final String name;
  final String image;
  const Governmentcard({super.key, required this.name, required this.image});

  @override
  State<Governmentcard> createState() => _GovernmentcardState();
}

class _GovernmentcardState extends State<Governmentcard> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 7,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(widget.image), fit: BoxFit.cover),
          ),
          child: Center(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      shadows: _isTapped ?
                      [
                        Shadow(
                          color: Colors.black.withAlpha(90)
                  )
                      ] : []
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
