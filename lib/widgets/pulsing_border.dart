import 'package:flutter/material.dart';

class PulsingBorder extends StatefulWidget {
  final Widget child;
  final Color color;
  final double padding;
  final Duration duration;

  const PulsingBorder({
    super.key,
    required this.child,
    required this.color,
    this.padding = 4,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<PulsingBorder> createState() => _PulsingBorderState();
}

class _PulsingBorderState extends State<PulsingBorder>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    _opacity = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacity,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(widget.padding),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color.withOpacity(_opacity.value),
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
