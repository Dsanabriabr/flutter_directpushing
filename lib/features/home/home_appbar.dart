import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTapLeadingButton;
  final VoidCallback onTapTrailingButton;
  final String title;

  const HomeAppBar({super.key, required this.onTapLeadingButton, required this.onTapTrailingButton, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      leading: IconButton(
      icon: const Icon(Icons.settings),
      onPressed: onTapLeadingButton,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: onTapTrailingButton,
        ),
      ],
    );
        
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}