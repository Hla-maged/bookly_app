import 'package:bookly_app/core/helper/assets.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> slidingAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    InitSlidingAnimation();

    NavigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsImages.logo,
        ),
        const SizedBox(
          height: 7,
        ),
        slidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void InitSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: const Offset(0, 0))
            .animate(animationController);

    animationController.forward();
  }

  void NavigateToHome() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      GoRouter.of(context).push('/home');
    });
  }
}
