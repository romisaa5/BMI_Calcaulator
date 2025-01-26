import 'package:bmiapp/screens/homescreen.dart';
import 'package:bmiapp/screens/resultscreen.dart';
import 'package:flutter/material.dart';

class Modifyvalues extends StatefulWidget {
  const Modifyvalues({super.key});

  @override
  State<Modifyvalues> createState() => _ModifyvaluesState();
}

class _ModifyvaluesState extends State<Modifyvalues> {
  int weight = 0;
  int age = 0;
  double hight = 100;
    double calculateBMI() {
    double heightInMeters = hight / 100; 
    return weight / (heightInMeters * heightInMeters);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Homescreen();
                        }));
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: 50,
                  ),
                  Text("BMI",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 83, 121, 203),
                        shadows: [
                          Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 5.0,
                            color: const Color.fromARGB(255, 67, 66, 66)
                                .withOpacity(0.5),
                          ),
                        ],
                      )),
                  Text(" Calculator",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 83, 121, 203),
                        shadows: [
                          Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 5.0,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 55,
            ),
            Text(
              "Please modify The Values",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
               fontFamily: "frist",color: const Color.fromARGB(168, 36, 35, 35)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                     
      width: 150,
      height: 350,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
  color: Color.fromARGB(255, 203, 227, 255),
       borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Height',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 10),
          Text(
            '$hight',
            style: TextStyle(
                  color:  Color.fromARGB(255, 52, 72, 146),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          RotatedBox(
                 quarterTurns: 3,
            child: Slider(
              
              value: hight,
              min: 100,
              max: 220,
              divisions: 120,
              activeColor:    Color.fromARGB(255, 52, 72, 146),
              inactiveColor: const Color.fromARGB(255, 188, 185, 185),
              onChanged: (value) {
                setState(() {
                  hight= value;
                });
              },
            ),
          ),
        ],
      ),),


               
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 170,
                        width: 173,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 203, 227, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Weight (Kg)",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 108, 108, 108),
                                      fontWeight: FontWeight.w500)),
                              Text(
                                "$weight",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 52, 72, 146),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35),
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Color.fromARGB(255, 52, 72, 146),
                                      )),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      child: Icon(
                                        Icons.add,
                                        size: 15,
                                        color:  Color.fromARGB(255, 52, 72, 146),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 170,
                        width: 173,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 203, 227, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Age",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 108, 108, 108),
                                      fontWeight: FontWeight.w500)),
                              Text(
                                "$age",
                                style: TextStyle(
                                    color:  Color.fromARGB(255, 52, 72, 146),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35),
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        size: 15,
                                        color:  Color.fromARGB(255, 52, 72, 146),
                                      )),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      child: Icon(
                                        Icons.add,
                                        size: 15,
                                        color:  Color.fromARGB(255, 52, 72, 146),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                    elevation: 5,
                    shadowColor: const Color.fromARGB(255, 60, 58, 58),
                    backgroundColor:  Color.fromARGB(255, 83, 121, 203),
                  ),
                  onPressed: () {
                    double bmi = calculateBMI(); // حساب الـ BMI
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Resultscreen(bmi: bmi), // تمرير الـ BMI
                ));
                  },
                  child: Text("Calculate",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500))),
            )
          ],
        ),
      ),
    );
  }
}
