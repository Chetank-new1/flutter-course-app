import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notesflutter/constants/routes.dart';
// import 'package:notesflutter/firebase_options.dart';
import 'package:notesflutter/material/dialog_utils.dart';
import 'dart:developer' as devtools show log;

class LoginVIew extends StatefulWidget {
  const LoginVIew({super.key});

  @override
  State<LoginVIew> createState() => _LoginVIewState();
}

class _LoginVIewState extends State<LoginVIew> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
        shadowColor: const Color.fromARGB(221, 245, 3, 3),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(hintText: 'Enter your email'),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(hintText: 'Enter your password'),
          ),
          ElevatedButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                // final userCredential =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                // devtools.log(userCredential.toString());
                Navigator.of(context).pushNamedAndRemoveUntil(
                  notesViewRoute,
                  (route) => false,
                );
              } on FirebaseAuthException catch (e) {
                var errorCode = e.code;
                var errorMessage = e.message;
                devtools
                    .log('FirebaseAuthException: $errorCode - $errorMessage');
                switch (e.code) {
                  case 'invalid-email':
                  case 'wrong-password':
                  case 'user-not-found':
                  case 'user-disabled':
                    showErrDialog(context, e.code);
                    break;
                  default:
                    // Log any other unexpected errors
                    devtools.log('Unexpected error occurred: ${e.code}');
                    break;
                }
              } catch (e) {
                devtools.log('Unexpected error occurred: $e');
              }

              // catch (e) {
              //   print('Somethingbad happened');
              //   print(e.runtimeType);
              //   print(e);
              // }
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('Not Registered yet? Register here!'),
          )
        ],
      ),
    );
  }
}
