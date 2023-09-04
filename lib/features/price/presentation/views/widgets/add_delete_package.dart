import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/package_cubit/package_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/switcher_cubit/switcher_cubit.dart';

class AddDeletePackage extends StatelessWidget {
  const AddDeletePackage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final packageCubit = context.read<PackageCubit>();
    final switcherCubit = context.watch<SwitcherCubit>();
    final size = MediaQuery.of(context).size;
    return switcherCubit.state == 1
        ? Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.add,
                    size: size.width > 320 ? 18 : 16,
                  ),
                  label: Text(
                    AppStrings.addTranslation(context),
                    style: TextStyle(fontSize: size.width > 320 ? 14 : 11),
                  ),
                  onPressed: () {
                    packageCubit.addPackage();
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.remove,
                    size: size.width > 320 ? 18 : 16,
                  ),
                  label: Text(
                    AppStrings.deleteTranslation(context),
                    style: TextStyle(fontSize: size.width > 320 ? 14 : 11),
                  ),
                  onPressed: () {
                    packageCubit.removeLastPackage();
                  },
                ),
              ),
            ],
          )
        : Container();
  }
}
