import 'package:flutter/material.dart';
import 'package:sistem_monitoring/UI/BrandUIComponent/BrandLayout.dart';
import 'package:sistem_monitoring/UI/CartUIComponent/CartLayout.dart';
import 'package:sistem_monitoring/UI/HomeUIComponent/Home.dart';
import 'package:sistem_monitoring/UI/AcountUIComponent/Profile.dart';

class bottomNavigationBar extends StatefulWidget {
  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int currentIndex = 0;

  /// Set a type current number a layout class
  Widget callPage(int current) {
    switch (current) {
      case 0:
        return new Menu();
      case 1:
        return new brand();
      case 2:
        return new cart();
      case 3:
        return new profil();
        break;
      default:
        return Menu();
    }
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(currentIndex),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(color: Colors.black26.withOpacity(0.15)))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            fixedColor: Color(0xFF6991C7),
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 23.0,
                  ),
                  title: Text(
                    "Beranda",
                    style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.report),
                  title: Text(
                    "Pelaporan",
                    style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more),
                  title: Text(
                    "Status",
                    style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 24.0,
                  ),
                  title: Text(
                    "Akun",
                    style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                  )),
            ],
          )),
    );
  }
}
