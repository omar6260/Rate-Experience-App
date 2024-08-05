import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_experience/src/features/rating/data/rating_provider.dart';

class RatingTextField extends StatefulWidget {
  const RatingTextField({
    super.key,
  });

  @override
  State<RatingTextField> createState() => _RatingTextFieldState();
}

class _RatingTextFieldState extends State<RatingTextField> {
  final TextEditingController _controller = TextEditingController();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_onFocusChange);
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Consumer<RatingProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            SizedBox(
              height: _isFocused ? 120 : 50,
              child: Stack(
                children: [
                  TextField(
                    controller: _controller,
                    maxLines: _isFocused ? 5 : 1,
                    decoration: InputDecoration(
                      fillColor: provider.labelColor,
                      filled: true,
                      hintText: 'Add a note',
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: provider.textColor,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
}
