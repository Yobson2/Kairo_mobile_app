import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kairo/core/config/env_provider.dart';
import 'package:kairo/core/network/dio_client.dart';
import 'package:kairo/core/network/network_info.dart';
import 'package:kairo/core/providers/supabase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_providers.g.dart';

/// Provides the [Connectivity] instance.
@Riverpod(keepAlive: true)
Connectivity connectivity(Ref ref) {
  return Connectivity();
}

/// Provides [NetworkInfo] for checking connectivity.
@Riverpod(keepAlive: true)
NetworkInfo networkInfo(Ref ref) {
  return NetworkInfoImpl(ref.watch(connectivityProvider));
}

/// Provides the configured [Dio] HTTP client.
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final env = ref.watch(envProvider);
  final supabaseClient = ref.watch(supabaseClientProvider);
  return DioClient.create(env: env, supabaseClient: supabaseClient);
}
