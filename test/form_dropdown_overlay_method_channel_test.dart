import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_dropdown_overlay/form_dropdown_overlay_method_channel.dart';

void main() {
  MethodChannelFormDropdownOverlay platform = MethodChannelFormDropdownOverlay();
  const MethodChannel channel = MethodChannel('form_dropdown_overlay');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
