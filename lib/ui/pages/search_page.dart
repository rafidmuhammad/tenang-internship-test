import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_test/cubit/search_cubit.dart';
import 'package:tenang_test/ui/widget/custom_text_field.dart';
import 'package:tenang_test/ui/widget/search_result_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController(text: "");

  @override
  void initState() {
    // TODO: implement initState
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
    context.read<SearchCubit>().dataSearch(searchController.text);
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

  Widget resultsView() {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.results.length,
            itemBuilder: (context, index) {
              return SearchResultItem(item: state.results[index]);
            },
          );
        } else if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Center(child: SizedBox());
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
              Expanded(child: resultsView()),
            ],
          ),
        ),
      ),
    );
  }
}
