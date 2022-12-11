import 'package:flutter_test/flutter_test.dart';
import 'package:form_dropdown_overlay/form_dropdown_overlay.dart';
import 'package:form_dropdown_overlay/form_dropdown_overlay_platform_interface.dart';
import 'package:form_dropdown_overlay/form_dropdown_overlay_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFormDropdownOverlayPlatform
    with MockPlatformInterfaceMixin
    implements FormDropdownOverlayPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FormDropdownOverlayPlatform initialPlatform = FormDropdownOverlayPlatform.instance;

  test('$MethodChannelFormDropdownOverlay is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFormDropdownOverlay>());
  });

  test('getPlatformVersion', () async {
    // FormDropdownOverlay formDropdownOverlayPlugin = FormDropdownOverlay();
    MockFormDropdownOverlayPlatform fakePlatform = MockFormDropdownOverlayPlatform();
    FormDropdownOverlayPlatform.instance = fakePlatform;

    // expect(await formDropdownOverlayPlugin.getPlatformVersion(), '42');
  });
}
