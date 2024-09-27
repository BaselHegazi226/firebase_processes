import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String snackText) {
  final SnackBar snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.grey.shade500,
    elevation: 8.0,
    margin: const EdgeInsets.all(10.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    content: Text(
      maxLines: 1,
      snackText,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        fontFamily: 'cairo',
      ),
    ),
    action: SnackBarAction(
      textColor: Colors.grey,
      backgroundColor: Colors.white,
      label: 'Close',
      onPressed: () async {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

/*
//good style for dark screen
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String snackText) {
  final SnackBar snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.white70,
    elevation: 8.0,
    margin: const EdgeInsets.all(10.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    content: Text(
      snackText,
      style: const TextStyle(
        color: Colors.blueGrey,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      ),
    ),
    action: SnackBarAction(
      textColor: Colors.blueGrey.withOpacity(.8),
      backgroundColor: Colors.white,
      label: 'Close',
      onPressed: () async {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

 */
