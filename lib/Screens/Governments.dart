import 'package:flutter/material.dart';
import 'package:tourist_guide_app/Screens/GovernmentDetails.dart';
import 'package:tourist_guide_app/Widgets/GovernmentCard.dart';

class Governments extends StatefulWidget {
  final String title;

  const Governments({super.key, required this.title});

  @override
  State<Governments> createState() => _GovernmentsState();
}

class _GovernmentsState extends State<Governments> {
  List governments = [
    {
      "name": "sinai",
      "image":
          "https://images.pexels.com/photos/30107330/pexels-photo-30107330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about": "The Sinai peninsula is a peninsula in Egypt, and the only part of the country located in Asia. It is between the Mediterranean Sea to the north and the Red Sea to the south, and is a land bridge between Asia and Africa. Sinai has a land area of about 60,000 km2 (23,000 sq mi) (6 percent of Egypt's total area) and a population of approximately 600,000 people.[1] Administratively, the vast majority of the area of the Sinai Peninsula is divided into two governorates: the South Sinai Governorate and the North Sinai Governorate. Three other governorates span the Suez Canal, crossing into African Egypt: Suez Governorate on the southern end of the Suez Canal, Ismailia Governorate in the center, and Port Said Governorate in the north.",
      "landmarks": [
        {
          "landmark1": {
            "landmarkName": "Dahab",
            "landmarkImage":
                "https://images.pexels.com/photos/30107330/pexels-photo-30107330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
          }
        },
        {
          "landmark2": {"landmarkName": "", "landmarkImage": ""}
        }
      ]
    },
    {
      "name": "Alexandria",
      "image":
      "https://images.pexels.com/photos/25323282/pexels-photo-25323282/free-photo-of-citadel-of-qaitbay-in-alexandria-seen-from-bay.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about": "Capital of Egypt",
      "landmarks": [
        {
          "landmark1": {
            "landmarkName": "Dahab",
            "landmarkImage":
            "https://images.pexels.com/photos/30107330/pexels-photo-30107330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
          }
        },
        {
          "landmark2": {"landmarkName": "", "landmarkImage": ""}
        }
      ]
    },
    {
      "name": "Luxor",
      "image":
      "https://images.pexels.com/photos/15188091/pexels-photo-15188091/free-photo-of-hot-air-balloons-in-the-sky.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about": "Capital of Egypt",
      "landmarks": [
        {
          "landmark1": {
            "landmarkName": "Dahab",
            "landmarkImage":
            "https://images.pexels.com/photos/30107330/pexels-photo-30107330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
          }
        },
        {
          "landmark2": {"landmarkName": "", "landmarkImage": ""}
        }
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: governments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Governmentdetails(government: governments[index],)));
                    },
                      child: Governmentcard(
                          name: governments[index]['name'],
                          image: governments[index]['image'])),
                );
              }),
        ),
      ),
    );
  }
}
