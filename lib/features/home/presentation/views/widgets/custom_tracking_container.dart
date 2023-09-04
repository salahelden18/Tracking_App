import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/core/functions/build_title_text.dart';
import 'package:kargomkolay_tracking_app/core/utils/snack_bar.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/custom_button.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/custom_tracking_fields.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/extra_two_button_widget.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views_model/drop_down_button_cubit/drop_down_button_cubit.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views_model/language_cubit/language_cubit.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views/track_view.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views_model/track_cubit/track_cubit.dart';

class CustomTrackingContainer extends StatefulWidget {
  const CustomTrackingContainer({super.key});

  @override
  State<CustomTrackingContainer> createState() =>
      _CustomTrackingContainerState();
}

class _CustomTrackingContainerState extends State<CustomTrackingContainer> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController trackingController;

  @override
  void initState() {
    super.initState();
    trackingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    trackingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropDownButtonCubit(),
      child: Card(
        elevation: 15,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding:
              const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 5),
          child: Column(
            children: [
              buidTitleText(context),
              const SizedBox(height: 20),
              // _buildTheTrackingFormField(),
              CustomTrackingFields(
                trackingController: trackingController,
                formKey: _formKey,
              ),
              const SizedBox(height: 20),
              _buildCustomButton(),
              if (MediaQuery.of(context).size.width > 320)
                const SizedBox(height: 10),
              if (MediaQuery.of(context).size.width > 320)
                const ExtraTwoButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Builder _buildCustomButton() {
    return Builder(builder: (context) {
      return BlocConsumer<TrackCubit, TrackState>(
        listener: (context, state) {
          if (state is TrackFailureState) {
            showSnackBar(context, text: state.message);
          } else if (state is TrackLoadedState) {
            // navigate the user and send the data with the navigator
            Navigator.of(context)
                .pushNamed(TrackView.routeName, arguments: state.trackModel);

            trackingController.text = '';
            context.read<DropDownButtonCubit>().resetState();
          }
        },
        builder: (context, state) {
          // if (state is TrackLoadingState) {
          //   return const CustomLoading();
          // }
          return CustomButton(
            onPress: () async {
              // unfocus all the fields
              FocusScope.of(context).unfocus();

              // validate the fields
              bool valid = _formKey.currentState!.validate();

              // invoking the cubits
              final dropDownCubit = context.read<DropDownButtonCubit>();
              final language = context.read<LanguageCubit>().state;

              if (valid) {
                await fetchData(dropDownCubit.state!,
                    trackingController.text.trim(), language);
              }
            },
          );
        },
      );
    });
  }

  Future<void> fetchData(
      String carrierCompany, String trackingNumber, String language) async {
    await context
        .read<TrackCubit>()
        .fetchTrackData(carrierCompany, trackingNumber, language);
  }
}
