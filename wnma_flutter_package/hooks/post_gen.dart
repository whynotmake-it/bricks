import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  // Run `flutter packages get` after generation.
  final progress = context.logger.progress('Running pub get');
  await Process.run('dart', ['pub', 'get']);
  progress.complete();

  if (context.vars['main'] == true) {
    final progress = context.logger.progress('Installing melos');
    await Process.run('dart', ['pub', 'global', 'activate', 'melos']);
    await Process.run('melos', ['bootstrap']);
    progress.complete();
  } else {
    context.logger.alert(
      "Make sure to run 'melos bootstrap'",
    );
  }
}
