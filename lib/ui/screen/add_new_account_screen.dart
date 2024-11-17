import 'package:expensefusion/common/base_components/base_assets.dart';
import 'package:expensefusion/common/base_components/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/base_components/back_button.dart';
import '../../common/base_components/base_app_bar.dart';
import '../../common/base_components/base_text.dart';
import '../../common/base_components/base_text_field.dart';
import '../../common/utils/strings_class.dart';

class AddNewAccountScreen extends StatefulWidget {
  const AddNewAccountScreen({super.key});

  @override
  State<AddNewAccountScreen> createState() => _AdState();
}

class _AdState extends State<AddNewAccountScreen> {
  final _typeAccountName = TextEditingController(),
      _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.bgColor,
      appBar: const BaseAppBar(
        showBackButton: true,
        backButtonWidget: BackButtonWidget(),
        title: BaseText(
          value: Strings.addNewAccount,
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
                labelText: 'Type Account Name',
                borderRadius: 16,
                hintText: 'Type Account Name',
                controller: _typeAccountName,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                validationMessage: 'Please Select Amount',
                isRequired: false,
                // prefix: const BaseText(
                //   value: '₹',
                //   fontSize: 18,
                //   fontWeight: FontWeight.w500,
                //   color: BaseColors.whiteColor,
                // ),
                contentPadding: const EdgeInsets.only(
                  top: 18,
                  bottom: 18,
                  left: 20,
                  right: 10.0,
                ),
              ),
              const SizedBox(height: 20),
              BaseTextField(
                labelText: 'Enter Amount',
                borderRadius: 16,
                hintText: Strings.enterAmount,
                controller: _amountController,
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
                )
              ),
              const SizedBox(height: 26),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog on Save click
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: BaseColors.primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const BaseText(
                  value: "Done",
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
