import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workout_tracker/auth/auth_service.dart';
import 'package:workout_tracker/auth/login_screen.dart';
import 'package:workout_tracker/calculator_screen.dart';

import 'package:workout_tracker/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void exportData() async{
    final CollectionReference exercises=FirebaseFirestore.instance.collection('exercises');

    final myData=await rootBundle.loadString("assets/datasets/exercises.csv");
    List<List<dynamic>> csvTable=CsvToListConverter().convert(myData);
    List<List<dynamic>> data=[];

    data=csvTable;

    for(var i=0; i < data.length; i++){
      var record = {
        "ExerciseName": data[i][0],
        "DescriptionURL": data[i][1],
        "ExerciseImage": data[i][1],
        "ExerciseImagAlt": data[i][2],
        "muscleGpDetails": data[i][4],
        "muscleGp": data[i][5],
        "equipmentDetails": data[i][6],
        "Equipment": data[i][7],
        "Rating": data[i][8],
        "Description": data[i][9]
      };
     exercises.add(record);
    }


  }
  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome User! Workout Tracker is designed as a tool to track progressive overload in weight training as well as provide insight on personal fitness goals",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Sign Out",
              onPressed: () async {
                await auth.signout();
                goToLogin(context);
              },
            ),
            CustomButton(
              label: "Max Calculator",
              onPressed: () async {
                goToCalculator(context);
              },
            ),
            ElevatedButton(onPressed: exportData,
                child: Text('Export CSV'))

            // CustomButton(
            //   label: "Exercise Viewer",
            //   onPressed: () async{
            //     goToExercises(context);
            //   },
            // )

          ],
        ),
      ),
    );
  }

  goToLogin(BuildContext context) =>
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  goToCalculator(BuildContext context) =>
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CalculatorScreen()),
      );
// goToExercises(BuildContext context) => Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => const WorkoutScreen()),
// );}
}