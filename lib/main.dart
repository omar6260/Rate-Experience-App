import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_experience/src/features/rating/data/rating_provider.dart';
import 'package:rate_experience/src/features/rating/presentation/screens/rating_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RatingProvider(),
      child: MaterialApp(
        title: 'Shopping Experience Rating',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const RatingScreen(),
      ),
    );
  }
}
