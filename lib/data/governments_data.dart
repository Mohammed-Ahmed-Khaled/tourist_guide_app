import '../models/government_model.dart';

List<GovernmentModel> governments = [
  GovernmentModel(
      id: '1',
      name: 'Sinai',
      imgUrl:
          "https://images.pexels.com/photos/30107330/pexels-photo-30107330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      about: "about"
          "The Sinai Peninsula in Egypt, located between Africa and Asia, is known for its beautiful landscape and long heritage. It is home to magnificent desert mountains, calm beaches, and hallowed religious locations. The area is popular for hiking, diving, and touring ancient monasteries.",
      landmarks: [
        {
          "landmarkName": "Mount Sinai",
          "landmarkImage":
              "https://images.pexels.com/photos/11560860/pexels-photo-11560860.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
        },
        {
          "landmarkName": "Saint Catherine's Monastery",
          "landmarkImage":
              "https://images.pexels.com/photos/1001967/pexels-photo-1001967.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
        }
      ]),
  GovernmentModel(
      id: "2",
      name: "Alexandria",
      imgUrl:
          "https://images.pexels.com/photos/25323282/pexels-photo-25323282/free-photo-of-citadel-of-qaitbay-in-alexandria-seen-from-bay.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      about:
          "Alexandria, Egypt’s second-largest city, is a Mediterranean gem blending history and modernity. Founded by Alexander the Great, it was once the center of knowledge and culture in the ancient world.",
      landmarks: [
        {
          "landmarkName": "Alexandria Library",
          "landmarkImage":
              "https://images.pexels.com/photos/15238618/pexels-photo-15238618/free-photo-of-interior-of-the-library-of-alexandria-alexandria-egypt.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
        },
        {
          "landmarkName": "Qaitbay Citadel",
          "landmarkImage":
              "https://images.pexels.com/photos/15238720/pexels-photo-15238720/free-photo-of-back-view-of-a-woman-and-a-girl-wearing-floral-patterned-dresses-walking-towards-a-castle.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
        }
      ]),
  GovernmentModel(
      id: "3",
      name: "Luxor",
      imgUrl:
          "https://images.pexels.com/photos/15188091/pexels-photo-15188091/free-photo-of-hot-air-balloons-in-the-sky.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      about:
          "Luxor often called the biggest outdoor museum in the world. Its Eastern Bank, which is split by the Nile, represents life, while the West Bank is emblematic of the afterlife. Luxor, a centre of ancient Egyptian history, provides a singular combination of cultural experiences and historical marvels.",
      landmarks: [
        {
          "landmarkName": "Karnak Temple",
          "landmarkImage":
              "https://images.pexels.com/photos/631339/pexels-photo-631339.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
        },
        {
          "landmarkName": "Valley of the Kings",
          "landmarkImage":
              "https://images.pexels.com/photos/15131579/pexels-photo-15131579/free-photo-of-aerial-view-of-archaeological-site.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
        }
      ]),
];
