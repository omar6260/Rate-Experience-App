import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_experience/src/features/rating/data/rating_provider.dart';
import 'package:rate_experience/src/features/rating/presentation/widgets/custom_slider.dart';

import '../widgets/rating_text_field.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RatingProvider>(
        builder: (context, provider, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color: provider.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: provider.labelColor,
                        icon: const Icon(Icons.close),
                        onPressed: () {},
                      ),
                      IconButton(
                        color: provider.labelColor,
                        icon: const Icon(Icons.info_outline),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'How was your shopping experience?',
                      style: TextStyle(
                          color: provider.textColor,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child:
                              FadeTransition(opacity: animation, child: child),
                        );
                      },
                      child: provider.ratingEmoji,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      provider.ratingText,
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                        color: provider.textColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CustomSlider(),
                  const SizedBox(height: 90),
                  const RatingTextField(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
