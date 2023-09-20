package com.example.kakao_map_sdk_flutter

import com.example.kakao_map_sdk_flutter.view.KakaoMapViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding

/** KakaoMapSdkFlutterPlugin */
class KakaoMapSdkFlutterPlugin : FlutterPlugin {

    override fun onAttachedToEngine(binding: FlutterPluginBinding) {
        binding
            .platformViewRegistry
            .registerViewFactory("kakaoMapPlatfromViewType", KakaoMapViewFactory())
    }

    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {}
}