import 'package:flutter/material.dart';
import 'package:tenang_test/model/doctor_model.dart';
import 'package:tenang_test/ui/widget/custom_text_field.dart';
import 'package:tenang_test/ui/widget/search_result_item.dart';

class SearchPage extends StatefulWidget {
  List<Doctor>? doctors = [];
  SearchPage({super.key, this.doctors});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController(text: "");
  List<Doctor>? results = [];
  List<Doctor>? resultsOut = [];

  @override
  void initState() {
    // TODO: implement initState
    results = widget.doctors;
    searchController.addListener(handler);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  void handler() {
    setState(() {
      resultsOut = results
          ?.where((element) => element.name
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
      print("panjang ${resultsOut?.length}");
    });
  }

  Widget search() {
    return GestureDetector(
      child: CustomTextField(
        hintText: "Search...",
        controller: searchController,
        imageUrl: 'assets/icon_search.png',
      ),
    );
  }

  Widget header(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        Expanded(child: search()),
      ],
    );
  }

  Widget resultsView(List<Doctor>? doctors) {
    return ListView.builder(
      itemCount: widget.doctors?.length,
      itemBuilder: (context, index) {
        return SearchResultItem(item: widget.doctors?[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            children: [
              header(context),
              Expanded(child: resultsView(resultsOut)),
            ],
          ),
        ),
      ),
    );
  }
}
