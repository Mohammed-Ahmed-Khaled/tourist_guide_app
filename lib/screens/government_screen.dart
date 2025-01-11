import 'package:flutter/material.dart';
import 'package:tourist_guide_app/data/governments_data.dart';
import 'package:tourist_guide_app/generated/l10n.dart';
import 'package:tourist_guide_app/widgets/government_card.dart';
import 'package:tourist_guide_app/widgets/translate.dart';

class GovernmentsScreen extends StatelessWidget {
  const GovernmentsScreen({
    super.key,
    required this.togglelanguage,
  });

  final void Function() togglelanguage;

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
              child: GovernmentCard(
                government: governments[index],
                togglelanguage: togglelanguage,
              ),
            );
          }),
    );
  }
}
