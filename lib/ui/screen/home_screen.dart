import 'package:expensefusion/common/base_components/base_text.dart';
import 'package:expensefusion/common/utils/utils_function.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/base_components/base_app_bar.dart';
import '../../common/base_components/base_assets.dart';
import '../../common/base_components/base_card_container.dart';
import '../../common/base_components/base_colors.dart';
import '../../common/base_components/base_network.dart';
import '../../common/utils/strings_class.dart';
import '../widget/bottom_bar_widget.dart';
import '../widget/drower_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _chosenValueHome, _chosenValueExpenses;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey(); // for app drawer

  List<Color> gradientPrimaryColors = [
    BaseColors.primaryColor,
    BaseColors.tileBGColor,
  ];
  List<Color> gradientSecondaryColors = [
    BaseColors.secondaryColor,
    BaseColors.tileBGColor,
  ];

  List<Color> gradientColorsSecond = [
    BaseColors.secondaryColor,
    BaseColors.secondaryColor,
    BaseColors.secondaryColor.withOpacity(0.5)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        drawer: CustomDrawer(
            onItemTap: (onItemValue) {
              Navigator.pop(context);
            },
            selectedIndex: 0),
        backgroundColor: BaseColors.bgColor,
        appBar: BaseAppBar(
          showBackButton: true,
          backButtonWidget: const Padding(
              padding: EdgeInsets.all(0.0),
              child: BaseImageNetwork(
                  link: BaseAssets.profileImage,
                  isAssetImage: true,
                  isNetworkImage: true,
                  fit: BoxFit.contain)),
          title: const BaseText(
            value: Strings.insight,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
          actions: [
            InkWell(
              onTap: () {
                _globalKey.currentState!.openDrawer();
              },
              child: Row(
                children: [
                  SvgPicture.asset(BaseAssets.menu),
                  const SizedBox(width: 10),
                  const BaseText(
                    value: Strings.menu,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(width: 10)
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            _priceTile(),
            const SizedBox(height: 30),
            buildTile(),
          ],
        )),
        bottomNavigationBar: const BottomBarWidget(),
        extendBody: true);
  }

  // Helper Widgets
  Widget _buildTitle({String? title, price, Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: TextStyle(
                color: color, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            "$price",
            style: const TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _priceTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: mediaQueryHeight(context, 0.03)),
          const BaseText(
            value: Strings.totalAmount,
            color: BaseColors.textGreyColor,
            fontSize: 18,
          ),
          const BaseText(
            value: '₹25,520.00',
            color: BaseColors.textColor,
            fontSize: 24,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: BaseCardContainer(
                    color: const Color(0xff141423),
                    borderColor: BaseColors.secondaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 55,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16)),
                                color: BaseColors.secondaryColor),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 15),
                                  SvgPicture.asset(BaseAssets.arrowDown,
                                      width: 40),
                                  const BaseText(
                                    value: Strings.income,
                                    color: BaseColors.bgColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ])),
                        const SizedBox(height: 20),
                        _buildTitle(
                            title: Strings.currentMonth,
                            price: '₹10,75,520',
                            color: BaseColors.textColor1),
                        const SizedBox(height: 10),
                        _buildTitle(
                            title: Strings.lastMonth,
                            price: '₹8,58,520',
                            color: BaseColors.textColor1),
                        const SizedBox(height: 20),
                      ],
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: BaseCardContainer(
                    borderColor: BaseColors.primaryColor,
                    color: const Color(0xff0b0f0d),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 55,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16)),
                                color: BaseColors.primaryColor),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 15),
                                  RotationTransition(
                                    turns:
                                        const AlwaysStoppedAnimation(180 / 360),
                                    child: SvgPicture.asset(
                                        BaseAssets.arrowDown,
                                        width: 40),
                                  ),
                                  const BaseText(
                                    value: Strings.expense,
                                    color: BaseColors.bgColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ])),
                        const SizedBox(height: 20),
                        _buildTitle(
                            title: Strings.currentMonth,
                            price: '₹10,75,520',
                            color: BaseColors.textColor1),
                        const SizedBox(height: 10),
                        _buildTitle(
                            title: Strings.lastMonth,
                            price: '₹8,58,520',
                            color: BaseColors.textColor1),
                        const SizedBox(height: 20),
                      ],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTile() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: getBorderRadius(),
          color: BaseColors.tileBGColor,
          boxShadow: const [
            BoxShadow(
                blurRadius: 0.2,
                spreadRadius: 0.5,
                offset: Offset(0, -0.8),
                color: BaseColors.borderColor),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseCardContainer(
                color: BaseColors.tileBGColor,
                borderColor: BaseColors.borderColor,
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          _buildDropdown(
                              title: "Home Expenses",
                              chosenValue: _chosenValueHome,
                              dataList: <String>['HDFC Back', 'SBI Bank'],
                              onChanged: (String? value) {
                                setState(() {
                                  _chosenValueHome = value;
                                });
                              }),
                          const VerticalDivider(
                            color: BaseColors.borderColor,
                            thickness: 1,
                          ),
                          const SizedBox(width: 15),
                          _buildDropdown(
                              title: "Current Month",
                              chosenValue: _chosenValueExpenses,
                              dataList: <String>[
                                "January",
                                "February",
                                "March",
                                "April",
                                "May",
                                "June",
                                "July",
                                "August",
                                "September",
                                "October",
                                "November",
                                "December",
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  _chosenValueExpenses = value;
                                });
                              }),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 30),
            const Center(
              child: BaseCardContainer(
                  borderRadius: 24,
                  color: BaseColors.bgColor,
                  borderColor: BaseColors.transparentColor,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 12.0),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BaseText(
                              value: '₹22,556',
                              color: BaseColors.secondaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                          VerticalDivider(
                            color: BaseColors.borderColor,
                            thickness: 3,
                          ),
                          BaseText(
                              value: '₹16,425',
                              color: BaseColors.primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                    ),
                  )),
            ),const SizedBox(height: 10),
            _buildLineChart(),
            const SizedBox(height: 20),
            const Divider(
              color: BaseColors.primaryColor,
            ),
            const SizedBox(height: 10),
            _headingTile(),
            const SizedBox(height: 20),
            _accountTile(),
            const SizedBox(height: 10),
          ],
        ));
  }

  Widget _buildDropdown(
      {String title = '',
      String? chosenValue,
      List<String> dataList = const [],
      required void Function(String?)? onChanged}) {
    return Expanded(
      child: DropdownButton<String>(
          focusColor: Colors.white,
          value: chosenValue,
          elevation: 5,
          isExpanded: true,
          padding: const EdgeInsets.symmetric(vertical: 5),
          underline: const SizedBox.shrink(),
          style: const TextStyle(color: Colors.white),
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.white,
          dropdownColor: BaseColors.bgColor,
          icon: SvgPicture.asset(BaseAssets.dropdownIcon),
          items: dataList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: BaseText(
                  value: value,
                  color: BaseColors.whiteColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            );
          }).toList(),
          hint: BaseText(
              value: title,
              color: BaseColors.whiteColor,
              fontSize: 17,
              fontWeight: FontWeight.w500),
          onChanged: onChanged),
    );
  }

  Widget _buildLineChart() {
    // Placeholder for a line chart
    return Container(
      // color: Colors.brown,
      height: 200,
      width: mediaQueryWidth(context, 1),
      child: LineChart(
        mainData(),
      ),
    );
  }

  _headingTile() {
    return const BaseText(
      value: Strings.accountOverview,
      fontWeight: FontWeight.w500,
      fontSize: 22,
    );
  }

  Widget _accountTile() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(
                  value: 'Office Expense',
                  fontWeight: FontWeight.w500,
                  color: BaseColors.primaryColor,
                  fontSize: 15),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                      value: 'HDFC Bank',
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  BaseText(
                      value: '₹10,25,645',
                      color: BaseColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                      value: 'Cash', fontWeight: FontWeight.w500, fontSize: 18),
                  BaseText(
                      value: '₹4,32,322',
                      color: BaseColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ],
              )
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: BaseColors.bgColor,
          );
        },
        itemCount: 3);
  }

  //chat
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: BaseColors.textColor1);
    const selectStyle = TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: BaseColors.whiteColor);
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Week 1', style: style);
        break;
      case 3:
        text = const Text('Week 2', style: style);
        break;
      case 5:
        text = const Text('Week 3', style: selectStyle);
        break;
      case 7:
        text = const Text('Week 4', style: style);
        break;
      case 9:
        text = const Text('Week 5', style: style);
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        // drawVerticalLine: true,
        // horizontalInterval: 1,
        // verticalInterval: 1,
        // getDrawingHorizontalLine: (value) {
        //   return const FlLine(
        //     color: BaseColors.secondaryColor,
        //     strokeWidth: 1,
        //   );
        // },
        // getDrawingVerticalLine: (value) {
        //   return const FlLine(
        //     color: BaseColors.secondaryColor,
        //     strokeWidth: 1,
        //   );
        // },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 10,
      minY: 0,
      maxY: 9,
      lineBarsData: [
        LineChartBarData(
          barWidth: 2.5,
          isCurved: true,
          spots: const [
            FlSpot(0, 6),
            FlSpot(1, 4),
            FlSpot(2, 6),
            FlSpot(3, 7.5),
            FlSpot(4, 6.5),
            FlSpot(5, 9),
            FlSpot(6, 7),
            FlSpot(7, 4),
            FlSpot(8, 6),
            FlSpot(9, 8),
            FlSpot(10, 10),
            FlSpot(11, 5),
          ],
          dotData: const FlDotData(
            show: false,
          ),
          color: BaseColors.primaryColor,
          // gradient: LinearGradient(
          //   begin: FractionalOffset.topCenter,
          //   end: FractionalOffset.bottomCenter,
          //   colors: gradientColors,
          // ),

          // isStrokeCapRound: false,

          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientPrimaryColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
        LineChartBarData(
          spots: const [
            FlSpot(0, 4),
            FlSpot(1, 2),
            FlSpot(2, 4),
            FlSpot(3, 5.5),
            FlSpot(4, 3),
            FlSpot(5, 6),
            FlSpot(6, 5),
            FlSpot(7, 9.5),
            FlSpot(8, 8.5),
            FlSpot(9, 6),
            FlSpot(10, 9),
            FlSpot(11, 9),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColorsSecond,
          ),
          barWidth: 2.5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientSecondaryColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
