import Flutter
import UIKit

public class SwiftKakaoMapSdkFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
      let factory = KakaoMapViewFactory(messenger: registrar.messenger())
              registrar.register(factory, withId: "kakaoMapPlatfromViewType")
  }
}
