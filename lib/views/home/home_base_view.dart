import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tezda_interview/constants/app_assets.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/views/favourite/favourite_view.dart';
import 'package:tezda_interview/views/home/home_view.dart';
import 'package:tezda_interview/views/profile/edit_profile.dart';

class HomeBaseView extends StatefulWidget {
  const HomeBaseView({super.key});

  @override
  State<HomeBaseView> createState() => _HomeBaseViewState();
}

class _HomeBaseViewState extends State<HomeBaseView> {
  int selectedIndex = 0;
  static final List _widgetOptions = [
    const HomeView(),
    const FavouriteView(),
    EditProfile()
    // const ProfileView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(selectedIndex)),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        decoration:
        BoxDecoration(color: Colors.white, border: Border.all(width: .1)),
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.home,
                  width: 25,
                  height: 25,
                  alignment: Alignment.topCenter,
                ),
                activeIcon: SvgPicture.asset(
                  AppAssets.home,
                  width: 25,
                  height: 25,
                  color: AppTheme.black,
                  alignment: Alignment.topCenter,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.favourite,
                  width: 25,
                  height: 25,
                  alignment: Alignment.topCenter,
                ),
                activeIcon: SvgPicture.asset(
                  AppAssets.favourite,
                  width: 25,
                  height: 25,
                  color: AppTheme.black,
                  alignment: Alignment.topCenter,
                ),
                label: 'Favorites',
              ),

              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.profile,
                  width: 25,
                  height: 25,
                  alignment: Alignment.topCenter,
                ),
                activeIcon: SvgPicture.asset(
                  AppAssets.profile,
                  width: 25,
                  height: 25,
                  color: AppTheme.black,
                  alignment: Alignment.topCenter,
                ),
                label: 'Profile',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            selectedItemColor: AppTheme.black,
            unselectedItemColor: Colors.grey,
            iconSize: 25,
            onTap: _onItemTapped,
            elevation: 0),
      ),
    );
  }
}
