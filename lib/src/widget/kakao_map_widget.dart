import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:kakao_map_sdk_flutter/src/util/const.dart';

class KakaoMapWidget extends StatelessWidget {
  const KakaoMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Pass parameters to the platform side.
    const Map<String, dynamic> creationParams = <String, dynamic>{};

    if (Platform.isAndroid) {
      return PlatformViewLink(
        viewType: viewType,
        surfaceFactory: (context, controller) => AndroidViewSurface(
          controller: controller as AndroidViewController,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        ),
        onCreatePlatformView: (params) {
          return PlatformViewsService.initSurfaceAndroidView(
            id: params.id, // id
            viewType: viewType, // 뷰 타입
            layoutDirection: TextDirection.ltr, // 레이아웃 방향
            creationParams: creationParams, // 플랫폼뷰에 전달할 파라미터
            creationParamsCodec: const StandardMessageCodec(), // 파라미터 인코딩 정보
            onFocus: () {
              params.onFocusChanged(true);
            },
          )
            ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
            ..create();
        },
      );
    } else if (Platform.isIOS) {
      return UiKitView(
        viewType: viewType, // 뷰 타입 (플랫폼 뷰와 연결)
        creationParams: creationParams,
        layoutDirection: TextDirection.ltr,
        creationParamsCodec: const StandardMessageCodec(),
        hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
        onPlatformViewCreated: (id) {},
      );
    } else {
      throw UnimplementedError('지원하지 않는 플랫폼입니다.');
    }
  }
}
