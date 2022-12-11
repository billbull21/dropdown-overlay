import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'form_dropdown_overlay_method_channel.dart';

abstract class FormDropdownOverlayPlatform extends PlatformInterface {
  /// Constructs a FormDropdownOverlayPlatform.
  FormDropdownOverlayPlatform() : super(token: _token);

  static final Object _token = Object();

  static FormDropdownOverlayPlatform _instance = MethodChannelFormDropdownOverlay();

  /// The default instance of [FormDropdownOverlayPlatform] to use.
  ///
  /// Defaults to [MethodChannelFormDropdownOverlay].
  static FormDropdownOverlayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FormDropdownOverlayPlatform] when
  /// they register themselves.
  static set instance(FormDropdownOverlayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
