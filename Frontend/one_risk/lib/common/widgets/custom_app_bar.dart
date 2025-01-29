import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Évaluation du Risque de Crédit'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
