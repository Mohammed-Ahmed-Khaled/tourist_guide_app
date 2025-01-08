import 'package:flutter/material.dart';
import 'package:tourist_guide_app/Widgets/GovernmentCard.dart';

class Governmentdetails extends StatefulWidget {
  final Map<String, dynamic> government;
  const Governmentdetails({super.key, required this.government});

  @override
  State<Governmentdetails> createState() => _GovernmentdetailsState();
}

class _GovernmentdetailsState extends State<Governmentdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.government['name']),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height /6,
            child: Governmentcard(name: widget.government['name'], image: widget.government['image'],),
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
              widget.government['about'],
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
                itemCount: widget.government["landmarks"].length,
              itemBuilder: (context, index) {
                var landmark = widget.government["landmarks"][index];
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
