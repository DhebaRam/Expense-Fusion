import 'package:expensefusion/common/base_components/base_assets.dart';
import 'package:expensefusion/common/base_components/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/base_components/back_button.dart';
import '../../common/base_components/base_app_bar.dart';
import '../../common/base_components/base_text.dart';
import '../../common/base_components/base_text_field.dart';
import '../../common/utils/strings_class.dart';
import '../../common/utils/utils_function.dart';
import '../widget/calender_widget.dart';

class AddIncomeScreen extends StatefulWidget {
  const AddIncomeScreen({super.key});

  @override
  State<AddIncomeScreen> createState() => _AdState();
}

class _AdState extends State<AddIncomeScreen> {
  final _selectAccount = TextEditingController(),
      _date = TextEditingController(),
      _amount = TextEditingController(),
      _note = TextEditingController();
  String? _selectedAccount;
  String _group = "Home Expense"; // Default group for account selection

  final Map<String, List<String>> _accounts = {
    "Home Expense": ["HDFC Bank", "SBI Bank"],
    "Office Expense": ["HDFC Bank ", "Cash"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.bgColor,
      appBar: const BaseAppBar(
        showBackButton: true,
        backButtonWidget: BackButtonWidget(),
        title: BaseText(
          value: Strings.addIncome,
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
              const SizedBox(height: 30),
              BaseTextField(
                onTap: () {
                  _dropdownTile();
                },
                borderRadius: 16,
                labelText: Strings.selectAccount,
                hintText: '',
                fontSize: 17,
                readOnly: true,
                controller: _selectAccount,
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SvgPicture.asset(BaseAssets.dropdownIcon),
                ),
                validationMessage: 'Please enter select account',
                isEmail: true,
              ),
              const SizedBox(height: 20),
              BaseTextField(
                borderRadius: 16,
                onTap: () {
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                      // Add padding for small margin around
                      child: CalendarDialog(
                        // firstDay: _todayController.text.trim().isNotEmpty
                        //     ? DateFormat(outFormat)
                        //         .parse(_todayController.text.trim())
                        //     : null,
                        // lastDay: DateTime.now(),
                        initialFocusedDay: DateTime.now(),
                        onDaySelected: (selectedDay) {
                          // Handle the selected day here
                          if (selectedDay != null) {
                            _date.text =
                                formatDateFromString(selectedDay.toString());
                          } else {
                            _date.text = '';
                          }
                        },
                      ),
                    ),
                  );
                },
                readOnly: true,
                labelText: Strings.noDate,
                hintText: Strings.noDate,
                controller: _date,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                validationMessage: 'Please Select Data',
                isRequired: false,
                contentPadding: const EdgeInsets.only(
                  top: 18,
                  bottom: 18,
                  left: 20,
                  right: 10.0,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SvgPicture.asset(BaseAssets.calenderIcon, height: 25, color: BaseColors.whiteColor,),
                ),
              ),
              const SizedBox(height: 20),
              BaseTextField(
                labelText: Strings.enterAmount,
                borderRadius: 16,
                hintText: Strings.enterAmount,
                controller: _amount,
                textInputType: TextInputType.number,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                validationMessage: 'Please Select Amount',
                isRequired: false,
                prefix: const BaseText(
                  value: '₹  ',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: BaseColors.whiteColor,
                ),
                contentPadding: const EdgeInsets.only(
                  top: 18,
                  bottom: 18,
                  left: 20,
                  right: 10.0,
                ),
              ),
              const SizedBox(height: 20),
              BaseTextField(
                labelText: Strings.writeNote,
                borderRadius: 16,
                hintText: Strings.writeNote,
                controller: _note,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                validationMessage: 'Please Select Amount',
                isRequired: false,
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
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: BaseColors.primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const BaseText(
                  value: "Submit",
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

  Future<Null> _dropdownTile() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        String? selectedAccount =
            _selectedAccount; // Local copy of the selected account
        String? selectedGroup = _group; // Local copy of the selected group

        return StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Select Account Bottom Sheet
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Close dialog on Save click
                  },
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              width: 2, color: BaseColors.whiteColor)),
                      child: const Icon(
                        Icons.close,
                        color: BaseColors.whiteColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    color: BaseColors.tileBGColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.2,
                        spreadRadius: 0.5,
                        offset: Offset(0, -0.8),
                        color: BaseColors.borderColor,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const BaseText(
                        value: "Select Account",
                        color: BaseColors.whiteColor,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 16),
                      ..._accounts.keys.map((group) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(
                              value: group,
                              color: BaseColors.primaryColor,
                              fontSize: 15,
                            ),
                            ..._accounts[group]!.map((account) {
                              return RadioListTile(
                                value: account,
                                groupValue: selectedAccount,
                                onChanged: (value) {
                                  setState(() {
                                    selectedAccount = value as String;
                                    selectedGroup = group;
                                  });
                                },
                                title: BaseText(
                                  value: account,
                                  color: BaseColors.whiteColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                activeColor: BaseColors.primaryColor,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              );
                            }).toList(),
                          ],
                        );
                      }).toList(),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, {
                            'account': selectedAccount,
                            'group': selectedGroup
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BaseColors.primaryColor,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const BaseText(
                          value: "Submit",
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: BaseColors.bgColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    ).then((result) {
      // Update the main screen after dismissing the bottom sheet
      if (result != null && result['account'] != null) {
        setState(() {
          _selectedAccount = result['account'];
          _group = result['group'];
          _selectAccount.text = _selectedAccount ?? '';
        });
      }
    });
  }
}
