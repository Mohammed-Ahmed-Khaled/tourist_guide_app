import '../generated/l10n.dart';
import '../models/government_model.dart';


List<GovernmentModel> governments = [
  GovernmentModel(id: '1',
    name: S.of(context).sinai,
    imgUrl:
    "https://images.pexels.com/photos/30107330/pexels-photo-30107330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    about: "about"
    "aboutSinai",
    landmarks: [
      {
        "landmarkName": "Dahab",
        "landmarkImage":
        "https://images.pexels.com/photos/30107330/pexels-photo-30107330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      },

        {"landmarkName": "dahab", "landmarkImage": "https://images.pexels.com/photos/30107330/pexels-photo-30107330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"}

    ]
    ),
    GovernmentModel(id: "2",
    name: "Alexandria",
    imgUrl:
    "https://images.pexels.com/photos/25323282/pexels-photo-25323282/free-photo-of-citadel-of-qaitbay-in-alexandria-seen-from-bay.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    about: "aboutAlexandria",
    landmarks: [
      {
        "landmarkName": "Dahab",
        "landmarkImage":
        "https://images.pexels.com/photos/30107330/pexels-photo-30107330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      },
        {"landmarkName": "name", "landmarkImage": "https://images.pexels.com/photos/30107330/pexels-photo-30107330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"}
    ]
    ),
  GovernmentModel(id: "3",
    name: "Luxor",
    imgUrl:
    "https://images.pexels.com/photos/15188091/pexels-photo-15188091/free-photo-of-hot-air-balloons-in-the-sky.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    about: "Capital of Egypt",
    landmarks: [
      {
        "landmarkName": "Dahab",
        "landmarkImage":
        "https://images.pexels.com/photos/30107330/pexels-photo-30107330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      },
      {"landmarkName": "name", "landmarkImage": "https://images.pexels.com/photos/30107330/pexels-photo-30107330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"}

    ]
  ),
];