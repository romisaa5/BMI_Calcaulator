
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Resultscreen extends StatefulWidget {
  const Resultscreen({super.key, required this.bmi});
final double bmi; 
  @override
  State<Resultscreen> createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen> {
    double bmiValue = 0;
 // استقبال قيمة BMI
   String getResultCategory() {
    if (widget.bmi < 18.5) {
      return "Underweight";
    } else if (widget.bmi >= 18.5 && widget.bmi < 25) {
      return "Normal";
    } else if (widget.bmi >= 25 && widget.bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

    String getResultMessage() {
    if (widget.bmi < 18.5) {
      return "You are underweight. It's important to focus on gaining weight by eating a balanced, nutritious diet. Please consult a healthcare professional for guidance.";
    } else if (widget.bmi >= 18.5 && widget.bmi < 25) {
      return "Congratulations! Your BMI is in the normal range, which means you're maintaining a healthy weight. Keep up with your balanced lifestyle!";
    } else if (widget.bmi >= 25 && widget.bmi < 30) {
      return "You are slightly overweight. Consider increasing physical activity and adopting healthier eating habits to bring your weight down.";
    } else {
      return "Your BMI indicates obesity. It’s important to work on a plan to reduce weight. Please consult a healthcare professional for advice on improving your health.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 75,
          ),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color.fromARGB(255, 140, 172, 252),
                Color.fromARGB(255, 117, 133, 167),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Text(
              'Your Result',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: SizedBox(
              height: 280,
              width: 280,
              child: SfRadialGauge(
                    enableLoadingAnimation: true, // تفعيل الأنيميشن
                  animationDuration: 2000, 
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 40,
                    ranges: <GaugeRange>[
                     GaugeRange(startValue: 0, endValue: 18.5, color: Colors.blue),
                      GaugeRange(startValue: 18.5, endValue: 25, color: Colors.green),
                      GaugeRange(startValue: 25, endValue: 30, color: Colors.orange),
                      GaugeRange(startValue: 30, endValue: 40, color: Colors.red),
                    ],
                    pointers: <GaugePointer>[
                      
                           NeedlePointer(
                          value: widget.bmi, // هنا قيمة BMI اللي عايز تحرك المؤشر إليها
                          enableAnimation: true, // تفعيل الأنيميشن
                          animationType: AnimationType.easeOutBack, // نوع الأنيميشن
                          animationDuration: 1500, // مدة الأنيميشن
                        ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Container(
                          child: Text(    widget.bmi.toStringAsFixed(1),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
           getResultCategory(), 
            style: TextStyle(
                color: Color.fromARGB(255, 83, 121, 203),
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                 getResultMessage(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "frist",
                    color: const Color.fromARGB(168, 36, 35, 35)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                elevation: 5,
                shadowColor: const Color.fromARGB(255, 60, 58, 58),
                backgroundColor:  Color.fromARGB(255, 83, 121, 203),
              ),
              onPressed: () {
                    Navigator.pop(context); 
              },
              child: Container(
                height: 25,
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Retry",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
