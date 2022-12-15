import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_test/cubit/page_cubit.dart';
import 'package:tenang_test/theme.dart';
import 'package:tenang_test/ui/pages/appointment_page.dart';
import 'package:tenang_test/ui/pages/inbox_page.dart';
import 'package:tenang_test/ui/pages/profile_page.dart';
import 'package:tenang_test/ui/widget/navigation_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  Widget buildContent(currentIndex) {
    switch (currentIndex) {
      case 0:
        return const AppointmentPage();
      case 1:
        return const AppointmentPage();
      case 2:
        return const InboxPage();
      case 3:
        return const ProfilePage();

      default:
        return const AppointmentPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, index) {
        return Scaffold(
          body: buildContent(index),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            height: 60,
            width: MediaQuery.of(context).size.width - (2 * 18),
            decoration: BoxDecoration(
                color: kAccentColor3, borderRadius: BorderRadius.circular(18)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                NavBar(
                  index: 0,
                  imageUrl: 'assets/icon_house.png',
                ),
                // ignore: prefer_const_constructors
                NavBar(
                  index: 1,
                  imageUrl: 'assets/icon_book.png',
                ),
                // ignore: prefer_const_constructors
                NavBar(
                  index: 2,
                  imageUrl: 'assets/icon_chat.png',
                ),
                // ignore: prefer_const_constructors
                NavBar(
                  index: 3,
                  imageUrl: 'assets/icon_settings.png',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
