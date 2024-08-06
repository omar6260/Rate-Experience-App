import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_experience/src/features/rating/data/rating_provider.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Consumer<RatingProvider>(
            builder: (context, provider, child) {
              return Slider(
                thumbColor: provider.textColor,
                value: provider.rating,
                min: 0,
                max: 3,
                divisions: 2,
                onChanged: (value) {
                  provider.setRating(value);
                },
                activeColor: provider.labelColor,
                label: provider.ratingText,
              );
            },
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Bad',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                'Not Bad',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                'Good',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

