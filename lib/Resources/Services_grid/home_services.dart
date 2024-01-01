import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/Chat_App/Models/user_models.dart';
import 'package:health/Resources/AppColors/app_colors.dart';
import 'package:health/View/User_Pages/Doctor_visit/doctor_visit.dart';
import 'package:health/View/User_Pages/Laboratory/laboratory.dart';
import 'package:health/View/User_Pages/Nurse_visit/nurse_visit.dart';
import 'package:health/View/User_Pages/Vitamin_IV_drips_and_fluids/Vitamin_IV_drips_and_fluids.dart';

class HomeServices extends StatelessWidget {
  final IconData serviceIcon;
  final String serviceName;
  final VoidCallback onPressed;

  const HomeServices({
    Key? key,
    required this.serviceIcon,
    required this.serviceName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  serviceIcon,
                  size: 40.0,
                  color: MyColors.blue,
                ),
                SizedBox(width: 10.0),
                Text(
                  serviceName,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: MyColors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        
      ],
    );
  }
}

class Home_Services extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;

  const Home_Services({Key? key, required this.userModel, required this.firebaseUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      child: GridView.count(
        padding: EdgeInsets.all(0),
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 0.0,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: InkWell(
              onTap: () {
                Get.to(() => DoctorVisit());
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.medical_services_outlined,
                        size: 40.0,
                        color: MyColors.blue,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Doctor Visit",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: MyColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: InkWell(
              onTap: () {
                Get.to(() => Laboratory());
              },
              child: Container(
                height: 20.0,
                width: 50.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.science_outlined,
                        size: 40.0,
                        color: MyColors.blue,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Laboratory",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: MyColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 50),
            child: InkWell(
              onTap: () {
                Get.to(() => Vitamin(userModel: userModel, firebaseUser: firebaseUser,));
              },
              child: Container(
                height: 20.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_pharmacy_outlined,
                        size: 40.0,
                        color: MyColors.blue,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Vitamin IV Drips",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: MyColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 50),
            child: InkWell(
              onTap: () {
                Get.to(() => NurseVisit());
              },
              child: Container(
                height: 20.0,
                width: 50.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.medical_information_outlined,
                        size: 40.0,
                        color: MyColors.blue,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Nurse Visit",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: MyColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}




























// class Home_Services extends StatelessWidget {
//   final UserModel userModel;
//   final User firebaseUser;

//   const Home_Services({Key? key, required this.userModel, required this.firebaseUser}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
//       child: GridView.count(
//         padding: EdgeInsets.zero,
//         crossAxisCount: 2,
//         crossAxisSpacing: 10.0,  // Set crossAxisSpacing to 0.0 to remove horizontal gap
//         mainAxisSpacing: 10.0,  // Set mainAxisSpacing to 0.0 to remove vertical gap
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         children: [
//           _buildServiceItem(context, "Doctor Visit", Icons.medical_services_outlined, () {
//             Get.to(() => DoctorVisit());
//           }),
//           _buildServiceItem(context, "Laboratory", Icons.science_outlined, () {
//             Get.to(() => Laboratory());
//           }),
//           _buildServiceItem(context, "Doctor Visit", Icons.medical_services_outlined, () {
//             Get.to(() => DoctorVisit());
//           }),
//           _buildServiceItem(context, "Laboratory", Icons.science_outlined, () {
//             Get.to(() => Laboratory());
//           }),
          
//         ],
//       ),
//     );
//   }

//   Widget _buildServiceItem(BuildContext context, String serviceName, IconData serviceIcon, VoidCallback onPressed) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 40, bottom: 40),
//       child: InkWell(
//         onTap: onPressed,
//         child: Container(
//           width: MediaQuery.of(context).size.width / 2, // Set width to half of the screen width
//           height: MediaQuery.of(context).size.height / 4, // Adjust height as needed
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12.0),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 1,
//                 blurRadius: 5,
//               ),
//             ],
//           ),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   serviceIcon,
//                   size: 40.0,
//                   color: MyColors.blue,
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   serviceName,
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     color: MyColors.blue,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
