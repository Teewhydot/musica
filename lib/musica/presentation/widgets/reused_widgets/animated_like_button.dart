import 'package:flutter/material.dart';

class AnimatedLikeButton extends StatefulWidget {
  final String text;
  final IconData icon;

  const AnimatedLikeButton({super.key, required this.text, required this.icon});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedLikeButtonState createState() => _AnimatedLikeButtonState();
}

class _AnimatedLikeButtonState extends State<AnimatedLikeButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  bool _liked = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.green,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _liked = !_liked;
      if (_liked) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.icon,
            color: _colorAnimation.value,
          ),
          const SizedBox(width: 8),
          Text(widget.text),
        ],
      ),
    );
  }
}
