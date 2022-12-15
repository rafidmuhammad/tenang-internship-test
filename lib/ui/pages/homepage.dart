import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_test/cubit/doctor_cubit.dart';
import 'package:tenang_test/model/doctor_model.dart';
import 'package:tenang_test/theme.dart';
import 'package:tenang_test/ui/widget/custom_text_field.dart';
import 'package:tenang_test/ui/widget/doctor_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<DoctorCubit>().fetchDoctors();
    super.initState();
  }

  TextEditingController searchController = TextEditingController(text: "");

  Widget search() {
    return CustomTextField(
      hintText: "Search...",
      controller: searchController,
      imageUrl: 'assets/icon_search.png',
    );
  }

  Widget topDoctor() {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is DoctorSuccess) {
          List<Doctor> data = state.doctors.sublist(0, 3);
          return Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Doctors",
                  style: titleTextStyle,
                ),
                const SizedBox(height: 15),
                ...data
                    .map((item) => DoctorCard(
                        email: item.email, name: item.name, phone: item.phone))
                    .toList()
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [search(), topDoctor()],
      ),
    ));
  }
}
