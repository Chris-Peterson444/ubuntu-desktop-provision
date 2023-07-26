import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ubuntu_init/main.dart' as app;
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_provision_test/ubuntu_provision_test.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:yaru_test/yaru_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(YaruTestWindow.ensureInitialized);

  setUp(registerFakeInitServices);
  tearDown(resetAllServices);

  testWidgets('init', (tester) async {
    await tester.runApp(() => app.main([]));

    await tester.testLocalePage(language: 'Deutsch');
    await tester.tapNext();
    await tester.pumpAndSettle();
    await expectLocale('de_DE.UTF-8');

    await tester.testKeyboardPage(layout: 'Englisch (Britisch)');
    await tester.tapNext();
    await tester.pumpAndSettle();
    await expectKeyboard(const KeyboardSetting(layout: 'gb'));

    await tester.testNetworkPage(mode: ConnectMode.none);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testTimezonePage(timezone: 'Europe/Berlin');
    await tester.tapNext();
    await tester.pumpAndSettle();
    await expectTimezone('Europe/Berlin');

    const identity = Identity(
      realname: 'User',
      username: 'user',
      hostname: 'ubuntu',
    );
    await tester.testIdentityPage(
      identity: identity,
      password: 'password',
    );
    await tester.tapNext();
    await tester.pumpAndSettle();
    await expectIdentity(identity);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.testThemePage(theme: Brightness.dark);
    await tester.tapDone();
    await expectTheme(Brightness.dark);

    await expectLater(windowClosed, completes);
  });
}