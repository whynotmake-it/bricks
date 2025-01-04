import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  // Run `flutter packages get` after generation.
  final progress = context.logger.progress('Running pub get');
  await Process.run('dart', ['pub', 'get']);
  progress.complete();
}
