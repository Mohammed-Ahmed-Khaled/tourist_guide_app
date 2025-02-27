import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import 'government_detail_screen.dart';
import '../widgets/GovernmentCard.dart';
import '../data/governments_data.dart';
import '../widgets/translate.dart';

class GovernmentsScreen extends StatelessWidget {
  final void Function() togglelanguage;

  const GovernmentsScreen({super.key, required this.togglelanguage});

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
