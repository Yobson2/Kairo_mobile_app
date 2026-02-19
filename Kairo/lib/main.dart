import 'package:kairo/bootstrap.dart';
import 'package:kairo/core/config/app_config.dart';

/// Default entry point — uses app config environment.

void main() async {
  await bootstrap(const AppConfig());
}
