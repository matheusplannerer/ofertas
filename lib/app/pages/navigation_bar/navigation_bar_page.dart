import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/pages/navigation_bar/navigation_bar_controller.dart';
import 'package:ofertas/app/shared/global_service.dart';
import '../../shared/icons/sales_icon_icons.dart';

class NavigationBarPage extends StatefulWidget {
  final String title;

  final bool signedIn;

  const NavigationBarPage(
      {Key key, this.title = "NavigationBar", this.signedIn})
      : super(key: key);

  @override
  _NavigationBarPageState createState() => _NavigationBarPageState();
}

class _NavigationBarPageState
    extends ModularState<NavigationBarPage, NavigationBarController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(SalesIcon.money),
                title: Text(""),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.border_all),
                title: Text(""),
              ),
              if (controller.appController.signedIn)
                BottomNavigationBarItem(
                  icon: Icon(Icons.store),
                  title: Text(""),
                ),
            ],
            currentIndex: controller.navIndex,
            selectedItemColor: Colors.orange,
            onTap: (int index) {
              controller.setNavIndex(index, widget.signedIn);
            },
          );
        },
      ),
      body: Observer(
        builder: (_) {
          return IndexedStack(
            index: controller.navIndex,
            children: <Widget>[
              ...controller.appController.pages,
            ],
          );
        },
      ),
    );
  }
}
