import 'package:flutter/material.dart';

class AnimationHolder extends StatefulWidget {
  final Widget child;
  const AnimationHolder({super.key, required this.child});

  @override
  State<AnimationHolder> createState() => _AnimationHolderState(child);
}

class _AnimationHolderState extends State<AnimationHolder>
    with SingleTickerProviderStateMixin {
  final Widget child;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 1.5),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _AnimationHolderState(this.child);
  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return SlideTransition(position: _offsetAnimation, child: child);
  }
}
