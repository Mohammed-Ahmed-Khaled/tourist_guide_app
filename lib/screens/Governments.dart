import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import 'GovernmentDetailsScreen.dart';
import '../widgets/GovernmentCard.dart';
import '../data/governmentsData.dart';
import '../widgets/translate.dart';

class Governments extends StatelessWidget {
  final void Function() togglelanguage;

  const Governments({super.key, required this.togglelanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).governments),
        actions: [
          TranslateButton(togglelanguage: togglelanguage),
        ],
      ),
      body: ListView.builder(
          itemCount: governments.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.all(8.0),
                child: Governmentcard(
                    government: governments[index],
                    togglelanguage: togglelanguage));
          }),
    );
  }
}
