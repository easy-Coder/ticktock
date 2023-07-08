import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticktok/src/app.dart';
import 'package:ticktok/src/features/post/presentations/create/widgets/camera_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  final container = ProviderContainer(
    overrides: [
      cameraProvider.overrideWithValue(
        cameras,
      ),
    ],
  );

  runApp(UncontrolledProviderScope(
    container: container,
    child: const MainApp(),
  ));
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}
