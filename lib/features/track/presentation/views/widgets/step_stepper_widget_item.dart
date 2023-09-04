import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';

class StepStepperItemWidget extends StatelessWidget {
  const StepStepperItemWidget(
      {super.key,
      this.isActive = false,
      required this.text,
      required this.isLast});
  final bool isActive;
  final String text;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: isLast ? size.width * 0.10 : size.width * 0.35,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  color: isActive ? getActiveColor(context, text) : Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 30,
                left: -15,
                child: SizedBox(
                  width: size.width * 0.25,
                  child: Text(
                    text,
                    style: TextStyle(fontSize: size.width <= 320 ? 12 : 16),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
          if (!isLast)
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const Divider(),
              ),
            ),
        ],
      ),
    );
  }

  Color getActiveColor(BuildContext context, String label) {
    if (AppStrings.returnedToSender(context) == label) {
      return Colors.orange;
    } else if (AppStrings.notDelivered(context) == label) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}


/*
Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 22,
          width: 22,
          decoration: BoxDecoration(
            color: isActive ? Colors.green : Colors.grey,
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            Icons.check,
            size: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(text),
      ],
    );
*/