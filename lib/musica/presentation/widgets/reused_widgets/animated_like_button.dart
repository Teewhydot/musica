// import 'package:flutter/material.dart';
//
// class AnimatedLikeButton extends StatefulWidget {
//   final String text;
//   final IconData icon;
//
//   const AnimatedLikeButton({super.key, required this.text, required this.icon});
//
//   @override
//   _AnimatedLikeButtonState createState() => _AnimatedLikeButtonState();
// }
//
// class _AnimatedLikeButtonState extends State<AnimatedLikeButton>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Color?> _colorAnimation;
//   late Animation<double> _scaleAnimation;
//
//   bool _liked = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _colorAnimation = ColorTween(
//       begin: Colors.grey,
//       end: Colors.red,
//     ).animate(_controller);
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _handleTap() {
//     setState(() {
//       _liked = !_liked;
//       if (_liked) {
//         _controller.forward();
//       } else {
//         _controller.reverse();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       child: ScaleTransition(
//         scale: _scaleAnimation,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SizedBox(
//             height: 36,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(
//                   widget.icon,
//                   color: _colorAnimation.value,
//                 ),
//                 const SizedBox(width: 8),
//                 Text(widget.text),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:musica/musica/presentation/widgets/constants.dart';
//
// class AnimatedLikeButton extends StatefulWidget {
//   final String text;
//   final IconData icon;
//
//   const AnimatedLikeButton({Key? key, required this.text, required this.icon})
//       : super(key: key);
//
//   @override
//   _AnimatedLikeButtonState createState() => _AnimatedLikeButtonState();
// }
//
// class _AnimatedLikeButtonState extends State<AnimatedLikeButton>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Color?> _colorAnimation;
//   late Animation<double> _scaleAnimation;
//
//   bool _liked = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 100),
//     );
//     _colorAnimation = ColorTween(
//       begin: Colors.grey,
//       end: Colors.red,
//     ).animate(_controller);
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _handleTap() {
//     if (_liked) {
//       _controller.reverse(from: 1.0);
//     } else {
//       _controller.forward(from: 0.0);
//     }
//     setState(() {
//       _liked = !_liked;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       child: AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Transform.scale(
//             scale: _scaleAnimation.value,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: topClassWidgetColor,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 height: 36,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       widget.icon,
//                       color: _colorAnimation.value,
//                     ),
//                     const SizedBox(width: 8),
//                     Text(widget.text),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// class AnimatedLikeButton extends StatefulWidget {
//   final String text;
//   final String animationPath;
//
//   const AnimatedLikeButton({
//     Key? key,
//     required this.text,
//     required this.animationPath,
//   }) : super(key: key);
//
//   @override
//   _AnimatedLikeButtonState createState() => _AnimatedLikeButtonState();
// }
//
// class _AnimatedLikeButtonState extends State<AnimatedLikeButton>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Color?> _colorAnimation;
//   late Animation<double> _scaleAnimation;
//
//   bool _liked = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _colorAnimation = ColorTween(
//       begin: Colors.grey,
//       end: Colors.green,
//     ).animate(_controller);
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _handleTap() {
//     setState(() {
//       _liked = !_liked;
//       if (_liked) {
//         _controller.forward();
//       } else {
//         _controller.reverse();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       child: ScaleTransition(
//         scale: _scaleAnimation,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SizedBox(
//             height: 36,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Lottie.asset(
//                   widget.animationPath,
//                   height: 24,
//                   width: 24,
//                   animate: _liked,
//                   onLoaded: (composition) {
//                     _controller.duration = composition.duration;
//                   },
//                 ),
//                 const SizedBox(width: 8),
//                 Text(widget.text),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: library_private_types_in_public_api

// lottie file custom animation with flutter animation code removed
import 'package:flutter/material.dart' show AnimationController, BuildContext, Colors, GestureDetector, MainAxisSize, Row, SizedBox, State, StatefulWidget, Text, TextStyle, TickerProviderStateMixin, Widget;
import 'package:lottie/lottie.dart';
import 'package:musica/musica/presentation/widgets/constants.dart';

class AnimatedLikeButton extends StatefulWidget {
  final String text;
  final String animationPath;

  const AnimatedLikeButton({
    super.key,
    required this.text,
    required this.animationPath,
  });

  @override
  _AnimatedLikeButtonState createState() => _AnimatedLikeButtonState();
}

class _AnimatedLikeButtonState extends State<AnimatedLikeButton>
    with TickerProviderStateMixin {
  bool _liked = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 10),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _liked = !_liked;
          if (_liked) {
            _animationController.forward(from: 0.0);
          } else {
            _animationController.reverse(from: 1.0);
          }
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 48,
            child: Lottie.asset(
              widget.animationPath,
              controller: _animationController,
              onLoaded: (composition) {
                _animationController.duration = composition.duration;
              },
            ),
          ),
          Text(
            widget.text,
            style: TextStyle(
              color: _liked ? buttonPlayColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
