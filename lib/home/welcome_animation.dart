import 'package:flutter/material.dart';

class WelcomeAnimation extends StatefulWidget {
  const WelcomeAnimation({super.key});

  @override
  State<WelcomeAnimation> createState() => _WelcomeAnimationState();
}

class _WelcomeAnimationState extends State<WelcomeAnimation> {
  bool _isVisible = false;
  @override
  void initState() {
    super.initState();
    //Trigger the animation after the first frame renders
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              //1. Logo Fade and Scale
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOut,
                child: AnimatedScale(
                  scale: _isVisible ? 1.0 : 0.8,
                  duration: Duration(microseconds: 800),
                  curve: Curves.easeOutBack,
                  child: Image.asset(
                    'lib/assets/logo/FullLogo.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              //Title & Subtitle Slide Up + Fade
              AnimatedSlide(
                offset: _isVisible ? Offset.zero : const Offset(0, 0.2),
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutCubic,
                child: AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 700),
                  child: const Column(
                    children: [
                      Text(
                        'Cure One',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Millions of Diseases, One solution',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),

              //Action button
            ],
          ),
        ),
      ),
    );
  }
}
