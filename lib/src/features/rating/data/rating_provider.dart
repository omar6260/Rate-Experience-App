import 'package:flutter/material.dart';

class RatingProvider extends ChangeNotifier {
  double _rating = 2.0;

  double get rating => _rating;

  String get ratingText {
    if (_rating < 1.5) return 'BAD';
    if (_rating < 2.5) return 'NOT BAD';
    return 'GOOD';
  }

  Widget get ratingEmoji {
    if (_rating < 1.5) {
      return Image.asset(
        'assets/images/bad.png',
        key: const ValueKey('bad'),
        width: 300,
        height: 300,
      );
    } else if (_rating < 2.5) {
      return Image.asset(
        'assets/images/notbad.png',
        key: const ValueKey('not bad'),
        width: 300,
        height: 300,
      );
    } else {
      return Image.asset(
        'assets/images/good.png',
        key: const ValueKey('good'),
        width: 300,
        height: 300,
      );
    }
  }

  Color get textColor {
    if (_rating < 1.5) {
      return const Color(0xffAB3315);
    } else if (_rating < 2.5) {
      return const Color(0xffA36D08);
    } else {
      return const Color(0xff113600);
    }
  }

  Color get labelColor {
    if (_rating < 1.5) {
      return const Color(0xffF9B8A7);
    } else if (_rating < 2.5) {
      return const Color(0xffF7D390);
    } else {
      return const Color(0xffA6BA50);
    }
  }

  Color get backgroundColor {
    if (_rating < 1.5) {
      return const Color(0xffFD8263);
    } else if (_rating < 2.5) {
      return const Color(0xffE1AD4B);
    } else {
      return const Color(0xffAFC55C);
    }
  }

  void setRating(double newRating) {
    _rating = newRating;
    notifyListeners();
  }
}
