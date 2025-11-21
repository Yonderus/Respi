import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_text_field.dart';
import 'package:respi/features/Users/providers/auth_providers.dart';

class UpdatePage extends ConsumerStatefulWidget {
  const UpdatePage({super.key});

  @override
  ConsumerState<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends ConsumerState<UpdatePage> {
  final _emailCtrl = TextEditingController();
  final _usernameCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _usernameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          AppTextField(
            label: l10n.email,
            icon: Icons.email,
            obscureText: false,
            controller: _emailCtrl,
          ),

          // Campos de texto
          AppTextField(
            label: 'Username',
            icon: Icons.supervised_user_circle_outlined,
            obscureText: false,
            controller: _usernameCtrl,
          ),
        ],
      ),
    );
  }
}
