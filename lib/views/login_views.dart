import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notesflutter/firebase_options.dart';
import 'package:notesflutter/material/dialog_utils.dart';

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
        title: const Text('LOG IN'),
        // backgroundColor: Colors.blue, this thing prints the colour and makes it permanent on that place
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                children: [
                  TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration:
                        const InputDecoration(hintText: 'Enter your email'),
                  ),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration:
                        const InputDecoration(hintText: 'Enter your password'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: password);
                        print(userCredential);
                      } on FirebaseAuthException catch (e) {
                        print(
                            'FirebaseAuthException: ${e.code} - ${e.message}');
                        switch (e.code) {
                          case 'invalid-email':
                          case 'wrong-password':
                          case 'user-not-found':
                          case 'user-disabled':
                            showErrDialog(context, e.code);
                            break;
                          default:
                            // Log any other unexpected errors
                            print('Unexpected error occurred: ${e.code}');
                            break;
                        }
                      } catch (e) {
                        print('Unexpected error occurred: $e');
                      }

                      // catch (e) {
                      //   print('Somethingbad happened');
                      //   print(e.runtimeType);
                      //   print(e);
                      // }
                    },
                    child: const Text('Login'),
                  ),
                ],
              );
            default:
              return const Text('Loading...');
          }
        },
      ),
    );
  }
}
