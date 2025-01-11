import 'package:flutter/material.dart';
import '../models/government_model.dart';
import '../screens/government_detail_screen.dart';

class Governmentcard extends StatefulWidget {
  final GovernmentModel government;
  final void Function() togglelanguage;
  const Governmentcard(
      {super.key, required this.government, required this.togglelanguage});

  @override
  State<Governmentcard> createState() => _GovernmentcardState();
}

class _GovernmentcardState extends State<Governmentcard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => GovernmentDetailsScreen(
                government: widget.government,
                togglelanguage: widget.togglelanguage,
              ),
            ),
          );
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 7,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(widget.government.imgUrl),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.government.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
