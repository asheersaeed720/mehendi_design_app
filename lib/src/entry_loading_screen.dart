import 'package:flutter/material.dart';

class EntryLoadingScreen extends StatelessWidget {
  static const String routeName = '/entry';

  const EntryLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
