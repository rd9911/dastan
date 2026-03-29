import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'src/app/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Initialize background audio for tour playback (lock screen controls)
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.dastan.tours.channel.audio',
    androidNotificationChannelName: 'Tour Audio',
    androidNotificationOngoing: true,
    androidStopForegroundOnPause: true,
  );

  // Initialize Supabase
  // Note: Replace Anon Key with your actual key from the Supabase dashboard
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Dastan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
