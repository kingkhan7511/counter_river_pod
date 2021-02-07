import 'package:counter_river_pod/application/counter_notifier.dart';
import 'package:counter_river_pod/infrastructure/counter_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterRepository =
    Provider<CounterRepository>((ref) => CounterRepository());

final counterNotifierProvider = StateNotifierProvider(
    (ref) => CounterNotifier(ref.watch(counterRepository)));
