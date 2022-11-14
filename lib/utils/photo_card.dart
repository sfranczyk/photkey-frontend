import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:flutter_animate/extensions/num_duration_extensions.dart';
import 'package:photkey/providers/card_provider.dart';
import 'package:provider/provider.dart';

class PhotoCard extends StatefulWidget {
  final String urlPhoto;
  final bool isFront;
  final bool isSecond;
  final bool isShake;
  final bool isStared;

  const PhotoCard(
      {Key? key,
      required this.urlPhoto,
      required this.isFront,
      required this.isSecond,
      required this.isShake,
      required this.isStared})
      : super(key: key);

  @override
  State<PhotoCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: widget.isFront ? buildFrontCard() : buildCard());
  }

  Widget buildFrontCard() {
    return GestureDetector(
      child: Builder(
        builder: (context) {
          final provider = Provider.of<CardProvider>(context);
          final position = provider.position;
          final milliseconds = provider.isDragging ? 0 : 300;

          return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: milliseconds),
              transform: Matrix4.identity()
                ..translate(position.dx, position.dy),
              child: chooseBuild());
        },
      ),
      onPanStart: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);

        provider.startPosition(details);
      },
      onPanUpdate: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);

        provider.updatePosition(details);
      },
      onPanEnd: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);

        provider.endPosition();
      },
    );
  }

  Widget chooseBuild() {
    if (widget.isStared) {
      return buildAnimateShimmerCard();
    }
    if (widget.isShake) {
      return buildAnimateShakeCard();
    }
    return buildCard();
  }

  Widget buildAnimateShimmerCard() {
    return Animate(
      effects: [ShimmerEffect(delay: 800.ms, duration: 1600.ms)],
      onPlay: (controller) => controller.repeat(reverse: true),
      child: buildCard(),
    );
  }

  Widget buildAnimateShakeCard() {
    return Animate(
      effects: [ShakeEffect(delay: 800.ms, duration: 1600.ms)],
      onPlay: (controller) => controller.repeat(reverse: true),
      child: buildCard(),
    );
  }

  Widget buildCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: !widget.isFront && !widget.isSecond
          ? null
          : BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.32),
                  spreadRadius: 2,
                  blurRadius: 6,
                ),
              ],
            ),
      child: Stack(alignment: Alignment.bottomLeft, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
              height: double.infinity, widget.urlPhoto, fit: BoxFit.fitHeight),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: const [
              Text(
                'Tivolt ',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              Text(
                'by Miron Ostewski',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
        Center(
          child: widget.isStared ? const Icon(
            Icons.star_border_sharp,
            color: Colors.yellow,
            size: 200.0,
            shadows: <Shadow>[Shadow(color: Colors.deepPurple, blurRadius: 15.0)],
          ) : null,
        ),
      ]),
    );
  }
}
