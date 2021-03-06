import 'package:MediCaP/home/bloodbanks.dart';
import 'package:MediCaP/home/userprofile.dart';
import 'package:MediCaP/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOutBack,
      duration: Duration(seconds: 1),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.1 : 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          iconSize: 40,
                          color: Colors.cyan,
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          iconSize: 40,
                          color: Colors.cyan,
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              xOffset = 190;
                              yOffset = 80;
                              scaleFactor = 0.8;
                              isDrawerOpen = true;
                            });
                          }),
                  Text(
                    'MEDICAP',
                    style: GoogleFonts.mavenPro(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage())),
                    child: CircleAvatar(
                      minRadius: 30,
                      backgroundImage: AssetImage(
                          'images/businessman-profile-cartoon_18591-58479.jpg'),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('   Need a Plasma donar?',
                    style: GoogleFonts.lato(fontSize: 18, color: Colors.blue)),
                TextButton(
                  onPressed: null,
                  child: Text('See All',
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.blue)),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  UserProfile(
                      'images/userphotos/profile1.jpg', 'O+', "Shreyas"),
                  UserProfile(
                      'images/userphotos/profile2.jpg', 'AB+', "Prasad"),
                  UserProfile('images/userphotos/profile3.jpg', 'O-', "Shurti"),
                  UserProfile('images/userphotos/profile4.jpg', 'B+', "Shreya"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('  Need a Blood donar?',
                    style: GoogleFonts.lato(fontSize: 18, color: Colors.blue)),
                TextButton(
                  onPressed: null,
                  child: Text('See All',
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.blue)),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  UserProfile('images/userphotos/profile5.jpg', 'AB+', "Priya"),
                  UserProfile('images/userphotos/profile6.jpg', 'O+', "Hamsa"),
                  UserProfile(
                      'images/userphotos/profile7.jpg', 'A+', "Srinivas"),
                  UserProfile('images/userphotos/profile8.jpg', 'AB-', "KCR"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '   Nearby Blood Banks',
                  style: GoogleFonts.lato(fontSize: 18, color: Colors.blue),
                ),
                TextButton(
                  onPressed: null,
                  child: Text(
                    'See All',
                    style: GoogleFonts.lato(fontSize: 18, color: Colors.blue),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BLoodBank('images/bloodbank1.jpg', 'Blood Bank of Dellas'),
                  BLoodBank('images/bloodbank2.jpg', 'Blood bank of Madras'),
                  BLoodBank('images/bloodbank3.jpg', 'Maratha Blood Bank'),
                  BLoodBank('images/bloodbank4.jpg', 'Vijaya Blood Bank'),
                  BLoodBank('images/bloodbank5.jpg', 'SLMS Blood Bank'),
                ],
              ),
            ),
            Container(
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                    'images/chart-of-blood-types-in-drops-medical-and-vector-14313368.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
