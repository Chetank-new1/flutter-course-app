import 'package:flutter/material.dart';

// class DialogUtils {
// void showErrDialog(BuildContext context, String errorCode) {
//   String errorMessage = '';

//   switch (errorCode) {
//     case 'invalid-email':
//       errorMessage = 'Invalid email address.';
//       break;
//     case 'wrong-password':
//       errorMessage = 'Invalid password.';
//       break;
//     case 'user-not-found':
//       errorMessage = 'User not found.';
//       break;
//     case 'user-disabled':
//       errorMessage = 'User account has been disabled.';
//       break;
//     case 'weak-password':
//       errorMessage = 'Password is too weak. Please choose a stronger password.';
//       break;
//     case 'email-already-in-use':
//       errorMessage = 'Email is already in use. Please use a different email.';
//       break;
//     default:
//       errorMessage = 'An error occurred. Please try again later.';
//       break;
//   }

//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('Error'),
//       content: Text(errorMessage),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(); // Close the dialog
//           },
//           child: const Text('OK'),
//         ),
//       ],
//     ),
//   );
// }

Future<void> showErrorDialogue(
  BuildContext context,
  String text,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('An error occured'),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          )
        ],
      );
    },
  );
}
