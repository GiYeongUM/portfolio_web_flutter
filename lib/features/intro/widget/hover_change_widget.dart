import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HoverChangeWidget extends StatefulWidget {
  const HoverChangeWidget({Key? key, required this.firstChild, required this.secondChild}) : super(key: key);

  final Widget firstChild;
  final Widget secondChild;

  @override
  State<HoverChangeWidget> createState() => _HoverChangeWidgetState();
}

class _HoverChangeWidgetState extends State<HoverChangeWidget> {
  var isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: InkWell(
        onTap: () {
          setState(() {
            isHover = !isHover;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.firstChild,
            AnimatedPadding(
              padding: EdgeInsets.only(left: isHover ? 24 : 0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: Row(
                children: [
                  if (isHover) const Icon(Icons.arrow_forward).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut).fadeIn(duration: 500.ms, curve: Curves.easeInOut),
                  if (!isHover) const Icon(Icons.arrow_forward, color: Colors.transparent),
                  const SizedBox(width: 8),
                  widget.secondChild,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
