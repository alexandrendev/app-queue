
import 'package:app_queue/components/my_button.dart';
import 'package:app_queue/components/my_logo.dart';
import 'package:app_queue/components/my_text_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  
  LoginPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: BoxDecoration(
          color: Color(0xFFE39090),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MyLogo(),
            const SizedBox(height: 30),
            
            const SizedBox(height: 30),
            SizedBox(
              width: 250,
              child: MyTextInput(
                hintText: 'Matrícula', 
                obscureText: false, 
                controller: TextEditingController(), 
                validator: null, 
                keyboardType:  TextInputType.number,
            ),
            ),
            
            const SizedBox(height: 5),
            SizedBox(
              width: 250,
              child: MyTextInput(
                hintText: 'Digite sua senha', 
                obscureText: true, 
                controller: TextEditingController(), 
                validator: null, 
                keyboardType:  TextInputType.number,
                ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: MyButton(
                buttonText: 'Entrar', 
                onTapButton: (){},
                backgroundColor: Colors.green,
                textColor: Colors.black,
                ),
            ),
            const SizedBox(height: 7),
            SizedBox(
              width: 250,
              child: MyButton(
                buttonText: 'Cadastrar', 
                onTapButton: (){},
                backgroundColor: Colors.deepOrangeAccent,
                textColor: Colors.black,
                ),
            ),
          ],
        ),
      ),
    );
  }
}