import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/core/functions/after_two_days.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views_model/language_cubit/language_cubit.dart';

class ValidityDateWidget extends StatelessWidget {
  const ValidityDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final local = context.read<LanguageCubit>();
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.offerValidity(context),
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            afterTwoDays(local.state),
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}


/*
Align(
      alignment: Alignment.center,
      child: RichTextWidget(
        title: '${AppStrings.offerValidity(context)}\n',
        result: afterTwoDays(local.state),
      ),
    )
*/