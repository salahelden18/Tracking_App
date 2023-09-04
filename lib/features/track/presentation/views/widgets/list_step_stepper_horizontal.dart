import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/data_model.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views/widgets/step_stepper_widget_item.dart';

class ListStepStepperHorizontalWidget extends StatelessWidget {
  const ListStepStepperHorizontalWidget({super.key, required this.dataModel});

  final List<DataModel> dataModel;

  @override
  Widget build(BuildContext context) {
    final list = AppStrings.simpleStepperList(dataModel, context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          list.length,
          (index) => StepStepperItemWidget(
            text: list[index].label,
            isActive: list[index].isActive,
            isLast: index == 2,
          ),
        ).toList(),
      ),
    );
  }
}

/*
Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //this is the bubble
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: index==currentIndex?Colors.orange:Colors.transparent,
                  border: Border.all(color: currentIndex>=index?Colors.orange: Colors.black12),
                ),
              ),
            ),
            //this the ligne
            Container(
              height: 2,
              //why index+1 we want to turn the ligne orange that precede the active bubble
              color: currentIndex>=index+1?Colors.orange:Colors.black12,
            ),
          ],
        ),
        //index+1 we dont wanna show 0 in the screen since our index will start at 0
        Text('Page ${index+1}'),
      ],
    )*/
