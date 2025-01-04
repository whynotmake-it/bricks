import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final name = context.vars['project_name'] as String;

  // Run `flutter packages get` after generation.
  final progress = context.logger.progress('Running pub get');
  await Process.run('dart', ['pub', 'get'], workingDirectory: name);
  progress.complete();

  final melosProgress = context.logger.progress('Installing melos');
  await Process.run('dart', ['pub', 'global', 'activate', 'melos']);
  await Process.run('melos', ['bootstrap'], workingDirectory: name);
  melosProgress.complete();
}
