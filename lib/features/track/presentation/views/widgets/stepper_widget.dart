import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views_model/language_cubit/language_cubit.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/data_model.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views/widgets/custom_stepper.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({
    super.key,
    required this.data,
    required this.carrierCompany,
  });

  final List<DataModel> data;
  final String carrierCompany;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData(
        canvasColor: Colors.yellow,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.green,
              secondary: Colors.green,
            ),
      ),
      child: CustomStepper(
        physics: const NeverScrollableScrollPhysics(),
        controlsBuilder: (context, details) => Container(),
        steps: data
            .map((item) => _buildStepWidgetItem(
                context,
                item.status,
                item.description,
                item.timestamp,
                size,
                carrierCompany,
                item.isActive))
            .toList(),
        // steps: AppStrings.getStepperDataFormated(data, context)
        //     .map((e) => _buildStepWidgetItem(context, e.status, e.description,
        //         e.timestamp, size, carrierCompany, e.isActive))
        //     .toList(),
      ),
    );
  }

  StepCustom _buildStepWidgetItem(
    BuildContext context,
    String title,
    String? subtitle,
    String? date,
    Size size,
    String carrierCompny,
    bool isActive,
  ) {
    final DateFormat formatter =
        DateFormat('yyyy-MM-dd HH:mm:ss', context.read<LanguageCubit>().state);
    final String formattedTimestamp =
        formatter.format(DateTime.parse(date ?? ''));

    return StepCustom(
      state: StepStateCustom.complete,
      isActive: isActive,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: size.width <= 320 ? 14 : null),
                ),
              ),
              if (isActive) // will be changed later
                FittedBox(
                  child: Text(
                    formattedTimestamp,
                    style: TextStyle(
                      fontSize: size.width <= 320 ? 10 : 12,
                      color: Colors.grey,
                    ),
                  ),
                )
            ],
          ),
          const SizedBox(height: 5)
        ],
      ),
      subtitle: subtitle == null
          ? null
          : carrierCompany == 'DHL' &&
                  context.read<LanguageCubit>().state == 'ar'
              ? null
              : Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontSize: size.width <= 320 ? 10 : null),
                ),
      content: Container(),
    );
  }
}
