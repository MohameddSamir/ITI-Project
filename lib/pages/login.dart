import 'package:flutter/material.dart';
import 'package:flutter_projct/pages/MainScreen.dart';
import 'package:flutter_projct/pages/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _MyLoginForm();
}

class _MyLoginForm extends State<Login> {
  GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Container(
          color: Colors.grey[200],
          child: Form(
              key: formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('LogIn',
                      style: TextStyle(fontSize: 30, color: Colors.purple)),
                  const SizedBox(
                    height: 20,
                  ),
//username field
                  TextFormField(
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      hintStyle: TextStyle(fontSize: 20),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please Enter Your Username";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
// Password field
                  TextFormField(
                    obscureText: true,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 20),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please Enter Your Username";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

// Button
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple)),
                      onPressed: () {
                        if (formState.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()));
                        } else
                          print('not valid');
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
// text Button
                  Container(
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: const Text(
                          'Dont have an account ?',
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              )),
        ),
      )),
    );
  }
}
