import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/Chat_App/Models/user_models.dart';
import 'package:health/Chat_App/Pages/Home.dart';
import 'package:health/Resources/AppColors/app_colors.dart';
import 'package:health/Resources/Profile/profile.dart';
import 'package:health/View/User_Pages/Home_page/home_page.dart';
import 'package:health/View/User_services/User_appointments/User_appointments.dart';

class MyBottomNavBar extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;
  const MyBottomNavBar({super.key, required this.userModel, required this.firebaseUser});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: MyColors.blue,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 40),
          label: "Services",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month, size: 40),
          label: "Appointments",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, size: 40),
          label: "Chats",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 40),
          label: "My Profile",
        ),
      ],
      onTap: (index) {
        // Handle item click based on index
        if (index == 0) {
          Get.to(() => HomePage(
            userModel: userModel,
            firebaseUser: firebaseUser,
          ));
        } else if (index == 1) {
          Get.to(() => MyAppointments(
            userModel: userModel,
            firebaseUser: firebaseUser,
          ));
        } else if (index == 2) {
          Get.to(() => Home(
            userModel: userModel,
            firebaseUser: firebaseUser,
          ));
        } else if (index == 3) {
          Get.to(() => ProfilePage());
        }
      },
    );
  }
}