import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:notesflutter/firebase_options.dart';
// import 'package:notesflutter/material/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:notesflutter/views/login_views.dart';
import 'package:notesflutter/views/register_views.dart';
import 'package:notesflutter/views/verify_email_view.dart';
// import 'views/register_views.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 208, 8, 235)),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/login/': (context) => const LoginVIew(),
        '/register/': (context) => const RegisterView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    // final ThemeData theme = Theme.of(context);

    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            // final user = FirebaseAuth.instance.currentUser;
            // if (user?.emailVerified ?? false) {
            //   print('connection done.');
            // } else {
            //   return const VerifyEmailView();
            // }
            // return const Text('Done');
            return const LoginVIew();
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
