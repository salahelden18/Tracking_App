import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/core/helpers/custom_text_field_formatter.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/custom_text_field.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/package_cubit/package_cubit.dart';

class ParcelContent extends StatelessWidget {
  const ParcelContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final packageCubit = context.watch<PackageCubit>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
        packageCubit.state.length,
        (index) {
          final bool isLastPackage = index == packageCubit.state.length - 1 &&
              packageCubit.state.isNotEmpty;

          // Use a unique key for each CustomTextField widget
          final weightKey = Key('weight_$index');
          final heightKey = Key('height_$index');
          final widthKey = Key('width_$index');
          final lengthKey = Key('length_$index');

          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CustomTextField(
                    key: weightKey,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    formatters: [DoubleTextInputFormatter()],
                    label: '${AppStrings.weight(context)} (300kg max)',
                    onChange: (value) {
                      final updatedPackage = packageCubit.state[index].copyWith(
                        weight: double.tryParse(value) ?? 0.0,
                      );
                      packageCubit.updatePackageAtIndexAt(
                          index, updatedPackage);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    key: heightKey,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    formatters: [DoubleTextInputFormatter()],
                    label: '${AppStrings.height(context)} (150cm max)',
                    onChange: (value) {
                      final updatedPackage = packageCubit.state[index].copyWith(
                        height: double.tryParse(value) ?? 0.0,
                      );
                      packageCubit.updatePackageAtIndexAt(
                          index, updatedPackage);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    key: widthKey,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    formatters: [DoubleTextInputFormatter()],
                    label: '${AppStrings.width(context)} (120cm max)',
                    onChange: (value) {
                      final updatedPackage = packageCubit.state[index].copyWith(
                        width: double.tryParse(value) ?? 0.0,
                      );
                      packageCubit.updatePackageAtIndexAt(
                          index, updatedPackage);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    key: lengthKey,
                    textInputAction: isLastPackage
                        ? TextInputAction.done
                        : TextInputAction.next,
                    keyboardType: TextInputType.number,
                    formatters: [DoubleTextInputFormatter()],
                    label: '${AppStrings.length(context)} (240cm max)',
                    onChange: (value) {
                      final updatedPackage = packageCubit.state[index].copyWith(
                        length: double.tryParse(value) ?? 0.0,
                      );
                      packageCubit.updatePackageAtIndexAt(
                          index, updatedPackage);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ).toList()),
    );
  }
}



/*
ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      itemCount: packageCubit.state.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final bool isLastPackage = index == packageCubit.state.length - 1 &&
            packageCubit.state.isNotEmpty;

        // Use a unique key for each CustomTextField widget
        final weightKey = Key('weight_$index');
        final heightKey = Key('height_$index');
        final widthKey = Key('width_$index');
        final lengthKey = Key('length_$index');

        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.80,
          child: Column(
            children: [
              CustomTextField(
                key: weightKey,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                formatters: [DoubleTextInputFormatter()],
                label: '${AppStrings.weight(context)} (300kg max)',
                onChange: (value) {
                  final updatedPackage = packageCubit.state[index].copyWith(
                    weight: double.tryParse(value) ?? 0.0,
                  );
                  packageCubit.updatePackageAtIndexAt(index, updatedPackage);
                },
              ),
              const SizedBox(height: 10),
              CustomTextField(
                key: heightKey,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                formatters: [DoubleTextInputFormatter()],
                label: '${AppStrings.height(context)} (150cm max)',
                onChange: (value) {
                  final updatedPackage = packageCubit.state[index].copyWith(
                    height: double.tryParse(value) ?? 0.0,
                  );
                  packageCubit.updatePackageAtIndexAt(index, updatedPackage);
                },
              ),
              const SizedBox(height: 10),
              CustomTextField(
                key: widthKey,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                formatters: [DoubleTextInputFormatter()],
                label: '${AppStrings.width(context)} (120cm max)',
                onChange: (value) {
                  final updatedPackage = packageCubit.state[index].copyWith(
                    width: double.tryParse(value) ?? 0.0,
                  );
                  packageCubit.updatePackageAtIndexAt(index, updatedPackage);
                },
              ),
              const SizedBox(height: 10),
              CustomTextField(
                key: lengthKey,
                textInputAction:
                    isLastPackage ? TextInputAction.done : TextInputAction.next,
                keyboardType: TextInputType.number,
                formatters: [DoubleTextInputFormatter()],
                label: '${AppStrings.length(context)} (240cm max)',
                onChange: (value) {
                  final updatedPackage = packageCubit.state[index].copyWith(
                    length: double.tryParse(value) ?? 0.0,
                  );
                  packageCubit.updatePackageAtIndexAt(index, updatedPackage);
                },
              ),
            ],
          ),
        );
      },
    )
*/