import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelgo/models/departureModel.dart';
import 'package:travelgo/models/userModel.dart';
import 'package:travelgo/services/db.dart';
import 'package:travelgo/views/constants.dart';
import 'package:travelgo/views/homeview/homeview.dart';
import 'package:travelgo/views/notificationsview/notificationsview.dart';
import 'package:travelgo/views/profilview/profilview.dart';
import 'package:travelgo/views/ticketListview/ticketListview.dart';

import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

// optional, only if using provided badge style
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:provider/provider.dart';

class PageManagement extends StatefulWidget {
  final User user;
  const PageManagement({super.key, required this.user});

  @override
  State<PageManagement> createState() => _PageManagementState();
}

class _PageManagementState extends State<PageManagement> {
  Widget _displayingPage = Container();
  void initState() {
    super.initState();
    Widget _displayingPage = Homeview(user: widget.user);
  }

  Widget _pageSelected(int page) {
    switch (page) {
      case 0:
        return MyTicketsview();
        break;
      case 1:
        return Homeview(
          user: widget.user,
        );
        break;
      case 2:
        return Notificationsview();
        break;
      case 3:
        return Profilview(
          fromPageManagment: true,
          user: widget.user,
        );
        break;

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: KprimaryColor,
          buttonBackgroundColor: KsecondaryColor,
          height: 50.0,
          items: <Widget>[
            FaIcon(
              FontAwesomeIcons.moneyBillAlt,
              size: 30,
              color: Colors.white,
            ),
            FaIcon(
              FontAwesomeIcons.house,
              size: 30,
              color: Colors.white,
            ),
            FaIcon(
              FontAwesomeIcons.solidBell,
              size: 30,
              color: Colors.white,
            ),
            FaIcon(
              FontAwesomeIcons.solidUser,
              size: 30,
              color: Colors.white,
            ),
          ],
          onTap: (int tappedIndex) {
            setState(() {
              _displayingPage = _pageSelected(tappedIndex);
            });
          },
        ),
        body: _displayingPage);
  }
}
