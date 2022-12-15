import 'package:flutter/material.dart';
import 'package:tenang_test/model/doctor_model.dart';
import 'package:tenang_test/theme.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({Key? key, required this.item}) : super(key: key);

  final Doctor? item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(
        item!.name,
        style: subtitleTextStyle.copyWith(color: kAccentColor1),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        item!.email,
        style: body1TextStyle.copyWith(color: kAccentColor2),
      ),
      dense: true,
    );
  }
}
