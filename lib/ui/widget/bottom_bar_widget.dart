import 'package:expensefusion/ui/screen/add_income_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/base_components/base_assets.dart';
import '../../common/base_components/base_colors.dart';
import '../../common/base_components/base_text.dart';
import '../../common/utils/navigation_widget.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: BaseColors.transparentColor,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: BaseColors.transparentColor,
            width: 2,
          ),
        ),
        child: Row(children: [
          Expanded(
            child: InkWell(
              onTap: (){
                pushTo(context, const AddIncomeScreen());
              },
              child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: BaseColors.transparentColor,
                            spreadRadius: 0,
                            blurRadius: 10),
                      ],
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            BaseColors.secondaryColor,
                            BaseColors.secondaryColor
                          ])),
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(15),
                  child: const Row(
                    children: [
                      Icon(Icons.add),
                      BaseText(
                          value: 'Income',
                          color: BaseColors.bgColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ],
                  )),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child:
                  SvgPicture.asset(BaseAssets.bottomBar, fit: BoxFit.contain)),
          Expanded(
            child: Container(
                height: 60,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: BaseColors.transparentColor,
                          spreadRadius: 0,
                          blurRadius: 10),
                    ],
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          BaseColors.primaryColor,
                          BaseColors.primaryColor
                        ])),
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(15),
                child: const Row(
                  children: [
                    Icon(Icons.add),
                    BaseText(
                        value: 'Expense',
                        color: BaseColors.bgColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ],
                )),
          )
        ]));
  }
}
