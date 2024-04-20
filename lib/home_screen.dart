import 'package:workout_tracker/auth/auth_service.dart';
import 'package:workout_tracker/auth/login_screen.dart';
import 'package:workout_tracker/calculator_screen.dart';
import 'package:workout_tracker/workouts_screen.dart';

import 'package:workout_tracker/widgets/button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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