import 'ubuntu_init_localizations.dart';

/// The translations for Italian (`it`).
class UbuntuInitLocalizationsIt extends UbuntuInitLocalizations {
  UbuntuInitLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get welcomePageTitle => 'Benvenuti';

  @override
  String welcomePageHeader(Object distro) {
    return 'Benvenuto in $distro';
  }

  @override
  String get welcomeWhatsNew => 'COSA C\'È DI NUOVO?';

  @override
  String get welcomeStartTitle => 'A streamlined start';

  @override
  String get welcomeStartSubtitle => 'Supporting a cleaner setup experience.';

  @override
  String get welcomeStoreTitle => 'New look App Store';

  @override
  String get welcomeStoreSubtitle => 'It\'s never been easier to find your favourite software.';

  @override
  String get welcomeSecurityTitle => 'Enhanced security';

  @override
  String get welcomeSecuritySubtitle => 'New options for hardware-backed or ZFS encryption.';

  @override
  String welcomeChangelogLabel(Object url) {
    return '<a href=\"$url\">View changelog</a>';
  }

  @override
  String get telemetryPageTitle => 'Telemetry';

  @override
  String telemetryHeader(Object distro) {
    return 'Help improve $distro';
  }

  @override
  String telemetryDescription(Object distro) {
    return 'Share data anonymously with $distro so we can improve your experience.';
  }

  @override
  String telemetryLabelOn(Object distro) {
    return 'Yes, share system data with the $distro team';
  }

  @override
  String get telemetryLabelOff => 'No, don\'t share system data';

  @override
  String get telemetryReportLabel => 'Reporting details';

  @override
  String get telemetryReportTitle => 'Reporting details';

  @override
  String get telemetryLegalLabel => 'Legal';

  @override
  String get privacyPageTitle => 'Location services';

  @override
  String get privacyLocationTitle => 'Enable location services?';

  @override
  String get privacyLocationSubtitle => 'Let applications know your geographical location.\nYou can change this anytime in System Settings.';

  @override
  String get privacyLocationEnable => 'Location services';

  @override
  String get privacyPolicyLink => 'Data Privacy';

  @override
  String ubuntuProMagicAttachInstructions(Object url) {
    return 'Magic attach with this code at <a href=\"https://$url\">$url</a>';
  }

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProHeader => 'Attach this machine';
}
