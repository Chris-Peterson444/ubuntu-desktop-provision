import 'package:factory_reset_tools/horizontal_page.dart';
import 'package:factory_reset_tools/l10n/factory_reset_tools_localizations.dart';
import 'package:factory_reset_tools/pages/wizard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = FactoryResetToolsLocalizations.of(context);
    return HorizontalPage(
      windowTitle: lang.windowTitle,
      title: 'What would you like to do?',
      image: SvgPicture.asset('assets/images/laptop.svg'),
      bottomBar: const SizedBox(),
      children: [
        Row(
          children: [
            FilledButton(
              onPressed: () =>
                  Wizard.of(context).jump(ResetToolsRoutes.mediaSelector.name),
              child: const Text('Create Reset Media'),
            ),
            FilledButton(
              onPressed: () =>
                  Wizard.of(context).jump(ResetToolsRoutes.factoryReset.name),
              child: const Text('Start Factory Reset'),
            ),
          ].withSpacing(kWizardSpacing),
        ),
      ],
    );
  }
}
