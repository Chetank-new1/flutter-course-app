import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notesflutter/constants/routes.dart';
// import 'package:notesflutter/firebase_options.dart';
import 'package:notesflutter/utility/showerrordialogue.dart';
// import 'dart:developer' as devtools show log;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
        title: const Text("Register"),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
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
            // keyboardType: TextInputType.visiblePassword,
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
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
                Navigator.of(context).pushNamed(verifyViewRoute);
                // devtools.log(userCredential.toString());
              } on FirebaseAuthException catch (e) {
                // devtools.log('FirebaseAuthException: ${e.code} - ${e.message}');
                {
                  switch (e.code) {
                    case 'weak-password':
                    case 'email-already-in-use':
                    case 'invalid-email':
                      // if (context.mounted) {
                      await showErrorDialogue(
                        context,
                        e.code,
                      );
                      // }
                      break;
                    default:
                      // devtools.log(e.code);
                      await showErrorDialogue(
                        context,
                        e.toString(),
                      );
                      break;
                  }
                }
              } catch (e) {
                await showErrorDialogue(
                  context,
                  e.toString(),
                );
              }
            },
            child: const Text('Regsiter'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (route) => false,
              );
            },
            label: const Text('Already Registered? Login here!'),
          ),
        ],
      ),
    );
  }
}
