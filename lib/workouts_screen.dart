import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();
  double? _oneRepMax;

  @override
  void dispose() {
    _weightController.dispose();
    _repsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an exercise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async{
                // goToBench(context);
              },
              child: const Text("Bench Press"),
            ),
            ElevatedButton(
              onPressed: () async{
                // goToPullUp(context);
              },
              child: const Text("Pull-ups"),
            ),
            ElevatedButton(
              onPressed: () async{
                // goToSquat(context);
              },
              child: const Text("Squat"),
            ),
          ],
        ),
      ),
    );
  }

}
