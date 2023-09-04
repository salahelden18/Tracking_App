import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/widgets/custom_loading.dart';

class RightArrowPartWidget extends StatelessWidget {
  const RightArrowPartWidget({
    super.key,
    required bool isLoading,
  }) : _isLoading = isLoading;

  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: _isLoading
            ? const CustomLoading(
                color: Colors.white,
              )
            : const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
      ),
    );
  }
}
