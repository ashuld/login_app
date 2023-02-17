import 'package:flutter/material.dart';
import 'package:loginapp/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool error = false;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 55,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                  controller: usernameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username required';
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: passwordController,
                  obscureText: obscure,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password required';
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: obscure == true
                        ? IconButton(
                            icon: const Icon(Icons.lock_outline),
                            onPressed: () {
                              setState(() {
                                obscure = false;
                              });
                            },
                          )
                        : IconButton(
                            icon: const Icon(Icons.lock_open_sharp),
                            onPressed: () {
                              setState(() {
                                obscure = true;
                              });
                            },
                          ),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Visibility(
                  visible: error,
                  child: const Text(
                    'Incorrect Username or Password',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        if (usernameController.text == "ashish" &&
                            passwordController.text == '12345') {
                          var prefs = await SharedPreferences.getInstance();
                          prefs.setBool('isLogged', true);
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Homescreen(),
                              ));
                        } else {
                          setState(() {
                            error = true;
                          });
                          await Future.delayed(const Duration(seconds: 3));
                          setState(() {
                            error = false;
                          });
                        }
                      }
                    },
                    label: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    icon: const Icon(Icons.login),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
