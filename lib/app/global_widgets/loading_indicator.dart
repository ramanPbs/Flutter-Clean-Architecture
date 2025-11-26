import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingIndicator extends StatelessWidget {
  final bool isVisible;
  final String loadingText;

  static const double _kSize = 100;

  const LoadingIndicator({
    super.key,
    required this.isVisible,
    this.loadingText = '',
  });

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? Stack(
            children: [
              Positioned(
                  top: 20,
                  right: 20,
                  left: 20,
                  bottom: 20,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  )),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.fourRotatingDots(
                      color: Colors.black,
                      size: _kSize,
                    )
                  ],
                ),
              )
            ],
          )

        // Stack(
        //         children: [
        //           Positioned.fill(
        //             child: BackdropFilter(
        //               filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        //               child: const SizedBox(
        //                 height: double.infinity,
        //                 width: double.infinity,
        //               ),
        //             ),
        //           ),
        //           Center(
        //             child: Column(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 Container(
        //                   padding: const EdgeInsets.all(16.0),
        //                   decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     shape: BoxShape.circle,
        //                     boxShadow: [
        //                       BoxShadow(
        //                         color: Colors.black.withOpacity(0.1),
        //                         spreadRadius: 2,
        //                         blurRadius: 12,
        //                         offset: const Offset(0, 4),
        //                       ),
        //                     ],
        //                   ),
        //                   child: SvgPicture.asset('assets/loading.svg')
        //                       .animate(
        //                           onPlay: (controller) =>
        //                               controller.repeat()) // Start rotating
        //                       .rotate(
        //                         delay: Duration.zero,
        //                         duration: const Duration(seconds: 2),
        //                         curve: Curves.slowMiddle,
        //                       ),
        //                 ),
        //                 const SizedBox(height: 20),
        //                 AnimatedTextKit(
        //                   animatedTexts: [
        //                     ColorizeAnimatedText(
        //                       loadingText,
        //                       textStyle: Get.textTheme.titleMedium!.copyWith(
        //                         color: Get.theme.primaryColor,
        //                         fontWeight: FontWeight.w700,
        //                       ),
        //                       colors: [
        //                         Get.theme.primaryColor,
        //                         Get.theme.primaryColor.withOpacity(0.3),
        //                       ],
        //                       speed: const Duration(milliseconds: 250),
        //                     ),
        //                   ],
        //                   pause: Duration.zero,
        //                   repeatForever: true,
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       )
        : const SizedBox.shrink();
  }
}
