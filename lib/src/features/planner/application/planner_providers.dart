import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/features/planner/data/planner_repository.dart';
import 'package:dastan/src/features/planner/data/supabase_day_plan_service.dart';

part 'planner_providers.g.dart';

/// Provider for the local planner repository (Drift-based).
@riverpod
PlannerRepository plannerRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return DriftPlannerRepository(db);
}

/// Provider for the Supabase day plan sync service.
@riverpod
SupabaseDayPlanService supabaseDayPlanService(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseDayPlanService(client);
}
