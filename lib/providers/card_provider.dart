import 'package:flutter/material.dart';
import 'package:photkey/models/photo.dart';

enum CardStatus { like, dislike }

class CardProvider extends ChangeNotifier {
  List<Photo> _images = [];
  bool _isDragging = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  List<Photo> get images => _images;
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
    _images = <Photo>[
    Photo('Mi', 'coffee', 'Wrocław', 1380, 23, 'Coffee with milk.',
    'assets/images/coffee3.jpg'),
    Photo('Charles King', 'coffee', 'Wrocław', 1295, 234, 'My coffee.',
    'assets/images/coffee1.jpg'),
    Photo('Susann', 'coffee', 'Wrocław', 1654, 3245, 'Big noon coffee.',
    'assets/images/coffee2.png'),
    Photo('Charles King', 'coffee', 'Wrocław', 1295, 2345, 'My coffee.',
    'assets/images/coffee4.jpg'),
    Photo('Adam', 'coffee', 'Wrocław', 2138, 3344, 'Small morning coffee.',
    'assets/images/coffee1.jpg'),
    Photo('Susann', 'coffee', 'Wrocław', 1654, 34, 'Big noon coffee.',
    'assets/images/coffee2.png'),
    Photo('Mi', 'coffee', 'Wrocław', 1380, 3455, 'Coffee with milk.',
    'assets/images/coffee3.jpg'),
    Photo('Charles King', 'coffee', 'Wrocław', 1295, 355, 'My coffee.',
    'assets/images/coffee4.jpg'),
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
    if (_images.isEmpty) return;

    await Future.delayed(const Duration(milliseconds: 200));
    _images.removeLast();

    if (_images.isEmpty) {
      resetPhotos();
    }

    resetPosition();
  }
}
