import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final name = context.vars['project_name'] as String;
  // Run `flutter packages get` after generation.
  final progress = context.logger.progress('Running pub get');
  await Process.run('dart', ['pub', 'get'], workingDirectory: name);
  progress.complete();
}
