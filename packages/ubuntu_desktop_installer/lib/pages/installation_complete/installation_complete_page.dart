import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'installation_complete_model.dart';

const _kAvatarBorder = Color(0xFFe5e5e5);

class InstallationCompletePage extends StatelessWidget {
  const InstallationCompletePage({super.key});

  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    return Provider(
      create: (_) => InstallationCompleteModel(client),
      child: const InstallationCompletePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: AppBar(
        automaticallyImplyLeading: false,
        title: Text(lang.installationCompleteTitle),
      ),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 64, bottom: 32),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _kAvatarBorder,
                  width: 8,
                ),
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  'assets/installation_complete/logo.png',
                ),
              ),
            ),
          ),
          MarkdownBody(
            data: lang.readyToUse(ProductInfoExtractor().getProductInfo()),
          ),
          IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kContentSpacing),
                  child: ElevatedButton(
                    onPressed: () async {
                      final model = context.read<InstallationCompleteModel>();
                      await Wizard.of(context).done();
                      model.reboot(immediate: false);
                    },
                    child: Text(
                      lang.restartInto(ProductInfoExtractor().getProductInfo()),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () async {
                    final model = context.read<InstallationCompleteModel>();
                    await Wizard.of(context).done();
                    model.shutdown(immediate: false);
                  },
                  child: Text(lang.shutdown),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
