import 'package:flutter_riverpod/flutter_riverpod.dart';

// 데이터를 사용하지 않을 때, 자동으로 삭제를 하는 프로바이더이다.
final autoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));

  return [1, 2, 3, 4, 5];
});
