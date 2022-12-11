import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'form_dropdown_overlay_platform_interface.dart';

/// An implementation of [FormDropdownOverlayPlatform] that uses method channels.
class MethodChannelFormDropdownOverlay extends FormDropdownOverlayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('form_dropdown_overlay');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
