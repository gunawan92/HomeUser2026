import 'package:flutter/material.dart';

import '../../../design_system/components/stela_card.dart';

class HomePlaceholderPage extends StatelessWidget {
  const HomePlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('STELA Indonesia')),
    body: const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: StelaCard(
          child: Text('Fondasi aplikasi baru STELA telah siap.'),
        ),
      ),
    ),
  );
}
