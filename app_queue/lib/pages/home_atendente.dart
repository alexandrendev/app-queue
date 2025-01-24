import 'package:app_queue/components/my_button.dart';
import 'package:app_queue/components/my_person.dart';
import 'package:app_queue/components/my_priority.dart';
import 'package:flutter/material.dart';

class HomeAtendente extends StatelessWidget {
  const HomeAtendente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Title(
                color: Colors.black, 
                child: Text('Lista de Espera', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.04,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Priority(color: Colors.grey, position: 1),
                  SizedBox(
                    width: 10,
                  ),
                  MyPerson(name: 'Joaspdo'),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              // decoration: BoxDecoration(color: Colors.green),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.04,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Priority(color: Colors.grey, position: 2),
                  SizedBox(
                    width: 10,
                  ),
                  MyPerson(name: 'Joaspdo'),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              // decoration: BoxDecoration(color: Colors.green),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.04,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Priority(color: Colors.grey, position: 3),
                  SizedBox(
                    width: 10,
                  ),
                  MyPerson(name: 'Joaspdo'),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              // decoration: BoxDecoration(color: Colors.green),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.04,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                  Priority(color: Colors.grey, position: 4),
                  SizedBox(
                    width: 10,
                  ),
                  MyPerson(name: 'Joaspdo'),
                ],
              ),
            ),
          ]),
    );
  }
}
