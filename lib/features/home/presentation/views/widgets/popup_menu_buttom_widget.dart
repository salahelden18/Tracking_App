import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views_model/language_cubit/language_cubit.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  const PopupMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = AppStrings.getLanguages(context);
    return PopupMenuButton(
      icon: const FaIcon(FontAwesomeIcons.globe),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'en',
          child: Text(languages[0]),
        ),
        PopupMenuItem(
          value: 'tr',
          child: Text(languages[1]),
        ),
        PopupMenuItem(
          value: 'ar',
          child: Text(languages[2]),
        ),
      ],
      onSelected: (value) {
        context.read<LanguageCubit>().changeLanguage(value);
      },
    );
  }
}
