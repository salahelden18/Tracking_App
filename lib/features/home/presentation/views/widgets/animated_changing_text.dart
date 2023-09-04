import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';

class AnimatedChnagingText extends StatelessWidget {
  const AnimatedChnagingText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.titleMedium!,
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            ...AppStrings.getFeatureList(context)
                .map((e) => RotateAnimatedText(e))
                .toList()
          ],
        ),
      ),
    );
  }
}
