import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffEE0D0B),
            Color(0xffFCD514),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
        child: Marquee(
          text: AppLocalizations.of(context)!.slidingText,
          style: Theme.of(context).textTheme.bodySmall,
          blankSpace: 40.0,
          pauseAfterRound: const Duration(seconds: 1),
          velocity: 100,
        ),
      ),
    );
  }
}
