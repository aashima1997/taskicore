
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'customWidgets.dart';
import 'homepage.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    bool passVisible = true;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Welcome Icore"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Hello'
                  '\n'
                  'Hope you are doing Great!',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Login ',
                  style: TextStyle(fontSize: 30,
                    color: Colors.black,
                  ),
                )),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField
                (controller: nameController,
                decoration: InputDecoration(
                    labelText: 'User Name',
                    prefixIcon: const Icon(Icons.account_circle_rounded, color: Colors.blue,),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close, color: Colors.blue),
                      onPressed: () => nameController.clear(),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextField
                (controller: passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon:  const Icon(Icons.security, color: Colors.blue,),
                    labelStyle: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )
                ),
                obscureText: passVisible,
              ),
            ),

            Container(
                padding: const EdgeInsets.all(10),
                height: 70,
                width: 200,
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    SignUp();
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )
            ),
          ],
        ),
      ),
    );
  }

  SignUp()
  {
    if (nameController.text.isEmpty) {
      errordialog(context, "Information", "Enter User Name");
    }else if (passwordController.text.isEmpty) {
      errordialog(context, "Information", "Enter Password");
    }  else if (passwordController.text.length<=6) {
      errordialog(context, "Information", "Password must be atleast 6 Characters");
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const homePage()));
    }
   }
}
