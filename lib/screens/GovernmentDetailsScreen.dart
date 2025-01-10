import 'package:Tourist_guide/models/government_model.dart';
import 'package:Tourist_guide/widgets/translate.dart';
import 'package:flutter/material.dart';
import '../widgets/GovernmentCard.dart';

class GovernmentDetailsScreen extends StatefulWidget {
  final GovernmentModel government;
  final void Function() togglelanguage;
  const GovernmentDetailsScreen(
      {super.key, required this.government, required this.togglelanguage});

  @override
  State<GovernmentDetailsScreen> createState() =>
      _GovernmentDetailsScreenState();
}

class _GovernmentDetailsScreenState extends State<GovernmentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.government.name),
        actions: [TranslateButton(togglelanguage: widget.togglelanguage)],
      ),
      body: ListView(scrollDirection: Axis.vertical, children: [
        Hero(
          tag: widget.government.id,
          child: Image.network(
            widget.government.imgUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Text(
            'About',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color(0xFF332E28)),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            widget.government.about,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Center(
          child: Text(
            'Famous Landmarks',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color(0xFF332E28)),
          ),
        ),
        Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.government.landmarks.length,
                itemBuilder: (context, index) {
                  var landmark = widget.government.landmarks[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        landmark['landmarkName'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                      SizedBox(height: 10),
                      Image.network(
                        landmark['landmarkImage'],
                        // width: MediaQuery.of(context).size.width * 0.8,
                      )
                    ],
                  );
                }))
      ]),
    );
  }
}
