import 'package:flutter/material.dart';
import 'package:tourist_guide_app/models/governments_model.dart';
import 'package:tourist_guide_app/widgets/translate.dart';

class GovernmentdetailsScreen extends StatefulWidget {
  const GovernmentdetailsScreen({
    super.key,
    required this.government,
    required this.togglelanguage,
  });

  final GovernmentModel government;
  final void Function() togglelanguage;

  @override
  State<GovernmentdetailsScreen> createState() =>
      _GovernmentdetailsScreenState();
}

class _GovernmentdetailsScreenState extends State<GovernmentdetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.government.name),
        actions: [
          TranslateButton(togglelanguage: widget.togglelanguage),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
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
                fontSize: 30,
                color: Color(0xFF332E28),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              widget.government.about,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Center(
            child: Text(
              'Famous Landmarks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xFF332E28),
              ),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                    SizedBox(height: 10),
                    Image.network(
                      landmark['landmarkImage'],
                      // width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
