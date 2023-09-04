import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/custom_text_form_field.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/tab_bar_switcher.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final _weightController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _weightController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarSwitcher(tabController: _tabController),
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height * .40,
          child: TabBarView(
            controller: _tabController,
            children: [
              Center(
                child: CustomTextFormField(
                  controller: _weightController,
                  label: 'Weigth (KG)',
                  keyboardType: TextInputType.number,
                  formatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Weight';
                    }
                    return null;
                  },
                ),
              ),

              // second tab bar view widget
              Center(
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
