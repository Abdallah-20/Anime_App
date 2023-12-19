import 'package:anime_app/modules/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 40),
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email Must Be Filled';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.key),
                      suffixIcon: IconButton(
                          onPressed: () {
                              obscureText != obscureText;
                          },
                          icon: !obscureText
                              ? const Icon(CupertinoIcons.eye)
                              : const Icon(CupertinoIcons.eye_slash)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password Must Be Filled';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  MaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ,), (route) => false)
                      }
                    },
                    color: Colors.blue,
                    minWidth: double.infinity,
                    child: const Text('Login'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('You don\'t have an account ?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterScreen()),
                            );
                          },
                          child: const Text('Register')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
