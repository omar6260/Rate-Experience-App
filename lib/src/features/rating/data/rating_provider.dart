import 'package:flutter/material.dart';

class RatingProvider extends ChangeNotifier {
  double _rating = 2.0;

  double get rating => _rating;

  String get ratingText {
    if (_rating < 1.5) return 'BAD';
    if (_rating < 2.5) return 'NOT BAD';
    return 'GOOD';
  }
  /// Emoji image based on the rating value
  Widget get ratingEmoji {
    return Image.asset(
      _getImagePath(),
      key: ValueKey(_ratingTextKey()),
      width: 300,
      height: 300,
    );
  }
  /// Colors for the rating screen based on the rating value
  Color get textColor => _getColor(0xffAB3315, 0xffA36D08, 0xff113600);

  Color get labelColor => _getColor(0xffF9B8A7, 0xffF7D390, 0xffA6BA50);

  Color get backgroundColor => _getColor(0xffFD8263, 0xffE1AD4B, 0xffAFC55C);

  void setRating(double newRating) {
    if (newRating >= 0.0 && newRating <= 5.0) {
      _rating = newRating;
      notifyListeners();
    } else {
      throw ArgumentError('Rating must be between 0.0 and 5.0');
    }
  }
  /// Image path based on the rating value
  String _getImagePath() {
    if (_rating < 1.5) {
      return 'assets/images/bad.png';
    } else if (_rating < 2.5) {
      return 'assets/images/notbad.png';
    } else {
      return 'assets/images/good.png';
    }
  }
  /// Text key based on the rating value
  String _ratingTextKey() {
    if (_rating < 1.5) return 'bad';
    if (_rating < 2.5) return 'not bad';
    return 'good';
  }

  Color _getColor(int lowRatingColor, int midRatingColor, int highRatingColor) {
    if (_rating < 1.5) {
      return Color(lowRatingColor);
    } else if (_rating < 2.5) {
      return Color(midRatingColor);
    } else {
      return Color(highRatingColor);
    }
  }
}

