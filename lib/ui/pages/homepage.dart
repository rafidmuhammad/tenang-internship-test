import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_test/cubit/doctor_cubit.dart';
import 'package:tenang_test/model/doctor_model.dart';
import 'package:tenang_test/theme.dart';
import 'package:tenang_test/ui/pages/search_page.dart';
import 'package:tenang_test/ui/widget/categories.dart';
import 'package:tenang_test/ui/widget/doctor_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Doctor> doctors = [];
  @override
  void initState() {
    // TODO: implement initState
    context.read<DoctorCubit>().fetchDoctors();
    super.initState();
  }

  Widget search() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: textFieldColor, borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Image.asset(
              'assets/icon_search.png',
              width: 18,
            ),
            const SizedBox(
              width: 17,
            ),
            Expanded(
                child: Text(
              "Search...",
              style: body1TextStyle.copyWith(color: kAccentColor2),
            )),
          ],
        ),
      ),
    );
  }

  Widget topDoctor() {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is DoctorFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red[700],
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DoctorSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Doctors",
                  style: titleTextStyle,
                ),
                const SizedBox(height: 15),
                ...state.doctors
                    .map((item) => DoctorCard(
                        email: item.email, name: item.name, phone: item.phone))
                    .toList()
              ],
            ),
          );
        }
        return Container(
            margin: const EdgeInsets.only(top: 15),
            child: const Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget categories() {
    List<String> categories = [
      "Top",
      "New",
      "Last Used",
    ];
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Categories", style: titleTextStyle),
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...categories
                    .map((item) => Categories(category: item))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          search(),
          topDoctor(),
          categories(),
        ],
      ),
    ));
  }
}
