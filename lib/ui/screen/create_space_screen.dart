import 'package:expensefusion/common/base_components/base_colors.dart';
import 'package:flutter/material.dart';

import '../../common/base_components/back_button.dart';
import '../../common/base_components/base_app_bar.dart';
import '../../common/base_components/base_text.dart';
import '../../common/base_components/base_text_field.dart';
import '../../common/utils/navigation_widget.dart';
import '../../common/utils/strings_class.dart';
import 'add_new_account_screen.dart';

class CreateSpaceScreen extends StatefulWidget {
  const CreateSpaceScreen({super.key});

  @override
  State<CreateSpaceScreen> createState() => _AdState();
}

class _AdState extends State<CreateSpaceScreen> {
  final _typeSpaceName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.bgColor,
      appBar: const BaseAppBar(
        showBackButton: true,
        backButtonWidget: BackButtonWidget(),
        title: BaseText(
          value: Strings.createSpace,
          fontSize: 19,
          fontWeight: FontWeight.w500,
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              BaseTextField(
                labelText: 'Type Space Name',
                borderRadius: 16,
                hintText: 'Type Space Name',
                controller: _typeSpaceName,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                validationMessage: 'Please Select Amount',
                isRequired: false,
                prefix: const BaseText(
                  value: '₹ ',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: BaseColors.whiteColor,
                ),
                contentPadding: const EdgeInsets.only(
                  top: 18,
                  bottom: 18,
                  left: 20,
                  right: 0.0,
                ),
              ),
              const SizedBox(height: 26),
              ElevatedButton(
                onPressed: () {
                  pushReplace(context, const AddNewAccountScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: BaseColors.primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const BaseText(
                  value: "Next",
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: BaseColors.bgColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
