import 'package:expensefusion/common/base_components/base_assets.dart';
import 'package:expensefusion/common/base_components/base_colors.dart';
import 'package:expensefusion/common/base_components/base_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/base_components/base_network.dart';
import '../../common/utils/navigation_widget.dart';
import '../screen/create_space_screen.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onItemTap;
  final int selectedIndex;

  const CustomDrawer(
      {super.key, required this.onItemTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: BaseColors.tileBGColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(height: 80),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      height: 60,
                      width: 60,
                      color: BaseColors.tileBGColor,
                      child: const BaseImageNetwork(
                          link: BaseAssets.profileImage,
                          isAssetImage: true,
                          isNetworkImage: true,
                          fit: BoxFit.contain)
                      // Image.asset(AppAssets.user1Icon)
                      ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.38,
                        child: const BaseText(
                            value: 'Robin Roy',
                            fontSize: 19,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'OpenSans-SemiBold')),
                    const SizedBox(height: 5),
                    const BaseText(
                        value: '+91 235 235 2356',
                        fontSize: 15,
                        color: BaseColors.textColor1),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            const Divider(height: 0, color: BaseColors.bgColor),
            const SizedBox(height: 20),
            buildDrawerTile(() {
              onItemTap(0);
              pushTo(context, const CreateSpaceScreen());
            }, BaseAssets.spaceAccount, 'Spaces & Accounts'),
            const SizedBox(height: 30),
            buildDrawerTile(() {
              onItemTap(1);
            }, BaseAssets.transactions, 'Transactions'),
            const SizedBox(height: 30),
            buildDrawerTile(() {
              onItemTap(2);
            }, BaseAssets.logout, 'Logout', isLogout: true),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget buildDrawerTile(
      void Function()? onTap, String assetName, String textTitle,
      {bool isLogout = false, icon}) {
    return GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 0, right: 20),
                child: SvgPicture.asset(
                  assetName,
                  width: 40,
                  fit: BoxFit.fitWidth,
                  color:
                      isLogout ? BaseColors.redColor1 : BaseColors.whiteColor,
                )),
            BaseText(
                value: textTitle,
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: isLogout ? BaseColors.redColor1 : BaseColors.whiteColor),
          ],
        ));
  }
}
