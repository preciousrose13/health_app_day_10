import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health/Chat_App/Models/user_models.dart';
import 'package:health/Resources/AppBar/app_bar.dart';
import 'package:health/Resources/AppColors/app_colors.dart';
// ignore: unused_import
import 'package:health/Resources/Crousal_slider/slider_user.dart';
import 'package:health/Resources/Drawer/drawer.dart';
import 'package:health/Resources/Search_bar/search_bar.dart';
import 'package:health/Resources/Services_grid/home_services.dart';
import 'package:health/Resources/Services_grid/user_grid.dart';
import 'package:health/View/Splash_Screen/splash_screen.dart';
import 'package:health/View/User_Pages/virtual_consultation/virtual_consultation.dart';

class HomePage extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;

  HomePage({
    Key? key,
    required this.userModel,
    required this.firebaseUser,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user_appointments =
      FirebaseFirestore.instance.collection("User_appointments").snapshots();

  final accepted_appointments =
      FirebaseFirestore.instance.collection("Accepted_appointments");

  final CollectionReference user_appointment_delete =
      FirebaseFirestore.instance.collection("User_appointments");
  final _auth = FirebaseAuth.instance;

  bool acceptAppointment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.PageBg,
      appBar: MyAppBar(
          firebaseUser: widget.firebaseUser, userModel: widget.userModel),
      endDrawer: MyDrawer(
        ontap: () async{
            await GoogleSignIn().signOut();

            await FirebaseAuth.instance.signOut();

            _auth.signOut();

            Get.to(() => Splash_Screen());

        },
        userModel: widget.userModel,
        firebaseUser: widget.firebaseUser,
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
         
          MySearchBar(),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Virtual Medical Service:'.tr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                onTap: () {
                  Get.to(() => AvailableProviders());
                },
                tileColor: Colors.white,
                leading: Icon(Icons.medical_information, color: MyColors.blue, size: 30),
                title: Text(
                  "Virtual Consultations",
                  style: TextStyle(
                    color: MyColors.blue, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 18
                  ),
                ),
                subtitle: Text("Book an instant Virtual Consultation with a doctor",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
            ),
          ),

          SizedBox(
            height: 40,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Home Visit Service:'.tr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          Home_Services(
            userModel: widget.userModel, 
            firebaseUser: widget.firebaseUser
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'More Services:'.tr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          UserServicesGrid(),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Pending appointments".tr,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: user_appointments,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text(
                          snapshot.data!.docs[index]['email'].toString(),
                          style:
                              TextStyle(color: Colors.blue[700], fontSize: 16),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.docs[index]['address'].toString(),
                              style: TextStyle(color: Colors.green[800]),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              snapshot.data!.docs[index]["type"].toString(),
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ],
                        ),
                        leading: Icon(
                          Icons.person,
                          color: Colors.blue[700],
                          size: 40,
                        ),
                        trailing: Icon(
                          Icons.medical_services,
                          size: 35,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
