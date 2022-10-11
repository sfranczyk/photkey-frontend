import 'package:flutter/material.dart';

enum CardStatus { like, dislike }

class CardProvider extends ChangeNotifier {
  List<String> _urlImages = [];
  bool _isDragging = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  List<String> get urlImages => _urlImages;
  Offset get position => _position;
  bool get isDragging => _isDragging;

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  CardProvider() {
    resetPhotos();
  }

  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position = Offset(_position.dx + details.delta.dx, 0.0);

    notifyListeners();
  }

  void endPosition() {
    _isDragging = false;
    notifyListeners();

    final status = getStatus();

    switch (status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      default:
        resetPosition();
    }
  }

  CardStatus? getStatus() {
    final x = _position.dx;

    const delta = 100;

    if (x >= delta) {
      return CardStatus.like;
    } else if (x <= -delta) {
      return CardStatus.dislike;
    }
    return null;
  }

  void resetPhotos() {
    _urlImages = <String>[
      "assets/images/coffee1.jpg",
      "assets/images/coffee2.png",
      "assets/images/coffee3.jpg",
      "assets/images/coffee4.jpg"
    ].reversed.toList();
  }

  void like() {
    _position += Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

  void dislike() {
    _position -= Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    notifyListeners();
  }

  Future _nextCard() async {
    if (_urlImages.isEmpty) return;

    await Future.delayed(const Duration(milliseconds: 200));
    _urlImages.removeLast();

    if (_urlImages.isEmpty) {
      resetPhotos();
    }

    resetPosition();
  }
}
