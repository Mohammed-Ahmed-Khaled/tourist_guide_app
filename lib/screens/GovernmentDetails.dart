import 'package:Tourist_guide/models/government_model.dart';
import 'package:flutter/material.dart';
import '../widgets/GovernmentCard.dart';

class Governmentdetails extends StatefulWidget {
  final GovernmentModel government;
  const Governmentdetails({super.key, required this.government});

  @override
  State<Governmentdetails> createState() => _GovernmentdetailsState();
}

class _GovernmentdetailsState extends State<Governmentdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.government.name),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height /6,
            child: Governmentcard(name: widget.government.name, image: widget.government.imgUrl,),
          ),
          Center(
            child: Text(
              'About',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color(0xFF332E28)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              widget.government.about,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          Center(
            child: Text(
              'Famous Landmarks',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Color(0xFF332E28)
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21
                        ),
                      ),
                      SizedBox(height: 10),
                      Image.network(landmark['landmarkImage'],
                        // width: MediaQuery.of(context).size.width * 0.8,
                      )
                    ],
                  );
              }
            )
          )

        ]
      ),
    );
  }
}
