import 'package:flutter/material.dart';

import '../models/photo.dart';

class PhotoSelectCard extends StatefulWidget {
  final Photo photo;

  const PhotoSelectCard({Key? key, required this.photo}) : super(key: key);

  @override
  State<PhotoSelectCard> createState() => _PhotoSelectCardState();
}

class _PhotoSelectCardState extends State<PhotoSelectCard> {
  bool isSelected = false;

  void changeSelectedState() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
              margin: isSelected
                  ? const EdgeInsets.all(6)
                  : const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: isSelected
                    ? Border.all(
                        color: Theme.of(context).primaryColor, width: 2.0)
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 0,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    changeSelectedState();
                  },
                  child: ClipRRect(
                      borderRadius: isSelected
                          ? BorderRadius.circular(18)
                          : BorderRadius.circular(20),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor.withOpacity(0.2),
                          isSelected ? BlendMode.screen : BlendMode.dst,
                        ),
                        child: Image(
                            image: AssetImage(widget.photo.urlImage),
                            fit: BoxFit.cover),
                      )),
                ),
              )),
        ),
      ],
    );
  }
}
