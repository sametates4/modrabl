import 'dart:async';
import 'package:flutter/material.dart';

class _ToastEntry {
  final OverlayEntry entry;
  final Duration duration;
  final Duration fadeDuration;

  _ToastEntry({
    required this.entry,
    required this.duration,
    required this.fadeDuration,
  });
}

class MToast {
  BuildContext? context;

  static final MToast _instance = MToast._internal();

  factory MToast() {
    return _instance;
  }

  MToast init(BuildContext context) {
    _instance.context = context;
    return _instance;
  }

  MToast._internal();

  OverlayEntry? _entry;
  final List<_ToastEntry> _overlayQueue = [];
  Timer? _timer;
  Timer? _fadeTimer;

  _showOverlay() {
    if (_overlayQueue.isEmpty) {
      _entry = null;
      return;
    }
    if (context == null) {
      removeQueuedCustomToasts();
      throw ("Error: Context is null, Please call init(context) before showing toast.");
    }

    OverlayState overlay;
    try {
      overlay = Overlay.of(context!);
    } catch (err) {
      removeQueuedCustomToasts();
      throw ("""Error: Overlay is null. 
      Please don't use top of the widget tree context (such as Navigator or MaterialApp) or 
      create overlay manually in MaterialApp builder.
      More information 
        - https://github.com/ponnamkarthik/FlutterToast/issues/393
        - https://github.com/ponnamkarthik/FlutterToast/issues/234""");
    }
    // ignore: unnecessary_null_comparison
    if (overlay == null) {
      removeQueuedCustomToasts();
      throw ("""Error: Overlay is null. 
      Please don't use top of the widget tree context (such as Navigator or MaterialApp) or 
      create overlay manually in MaterialApp builder.
      More information 
        - https://github.com/ponnamkarthik/FlutterToast/issues/393
        - https://github.com/ponnamkarthik/FlutterToast/issues/234""");
    }

    _ToastEntry toastEntry = _overlayQueue.removeAt(0);
    _entry = toastEntry.entry;
    overlay.insert(_entry!);

    _timer = Timer(toastEntry.duration, () {
      _fadeTimer = Timer(toastEntry.fadeDuration, () {
        removeCustomToast();
      });
    });
  }

  removeCustomToast() {
    _timer?.cancel();
    _fadeTimer?.cancel();
    _timer = null;
    _fadeTimer = null;
    _entry?.remove();
    _entry = null;
    _showOverlay();
  }

  removeQueuedCustomToasts() {
    _timer?.cancel();
    _fadeTimer?.cancel();
    _timer = null;
    _fadeTimer = null;
    _overlayQueue.clear();
    _entry?.remove();
    _entry = null;
  }

  void showToast({
    required String msg,
    Duration toastDuration = const Duration(seconds: 2),

    Duration fadeDuration = const Duration(milliseconds: 350),
  }) {
    if (context == null) {
      throw ("Error: Context is null, Please call init(context) before showing toast.");
    }

    Widget newChild = Toast(duration: toastDuration,fadeDuration:  fadeDuration, msg: msg);


    OverlayEntry newEntry = OverlayEntry(builder: (_) {
      return Positioned(bottom: 50.0, left: 24.0, right: 24.0, child: newChild);
    });
    _overlayQueue.add(_ToastEntry(
        entry: newEntry, duration: toastDuration, fadeDuration: fadeDuration));
    if (_timer == null) _showOverlay();
  }

}

class Toast extends StatefulWidget {
  const Toast({Key? key, required this.msg, required this.duration, required this.fadeDuration}) : super(key: key);
  final String msg;
  final Duration duration;
  final Duration fadeDuration;
  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> with SingleTickerProviderStateMixin {

  AnimationController? _animationController;
  late Animation _fadeAnimation;
  Timer? _timer;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.fadeDuration,
    );
    _fadeAnimation =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeIn);
    super.initState();

    showIt();
    _timer = Timer(widget.duration, () {
      hideIt();
    });
  }

  showIt() {
    _animationController!.forward();
  }

  hideIt() {
    _animationController!.reverse();
    _timer?.cancel();
  }

  @override
  void deactivate() {
    _timer?.cancel();
    _animationController!.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation as Animation<double>,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(widget.msg, style: const TextStyle(color: Colors.white),)
            ),
          ),
        ),
      ),
    );
  }

}
