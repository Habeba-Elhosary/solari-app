import 'package:flutter/material.dart';
import 'core/flavors/flavors_config.dart';
import 'main.dart' as runner;

void main() {
  FlavorConfig(
    color: const Color(0xFFF4F2EE),
    name: 'PROD',
    location: BannerLocation.bottomEnd,
    variables: <String, dynamic>{
      'baseUrl': 'http://solari.rf.gd/api/v1/website/',
    },
  );
  runner.main();
}
