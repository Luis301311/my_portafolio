import 'package:flutter/material.dart';

class HoverScale extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scale;
  final Duration duration;

  const HoverScale({
    super.key,
    required this.child,
    this.onTap,
    this.scale = 1.2,
    this.duration = const Duration(milliseconds: 180),
  });

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  double _currentScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _currentScale = widget.scale),
      onExit: (_) => setState(() => _currentScale = 1.0),
      child: AnimatedScale(
        scale: _currentScale,
        duration: widget.duration,
        curve: Curves.easeOut,
        child: InkWell(
          onTap: widget.onTap,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: widget.child,
        ),
      ),
    );
  }
}
