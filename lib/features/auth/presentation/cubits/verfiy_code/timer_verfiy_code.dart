import 'dart:async';

class VerificatonCodeTimerStream {
  static final StreamController<int> _controller =
      StreamController<int>.broadcast();
  static Stream<int> get stream => _controller.stream;
  static int counterValue = 60;
  static int get counter => counterValue;

  static Timer? timer;

  static void listen() {
    _controller.stream.listen(
      (int event) {
        if (event == 0) {
          controllerClose();
        }
      },
    );
  }

  static void decrement() {
    counterValue--;
    _controller.sink.add(counterValue);
  }

  static void autoDecrement() {
    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      decrement();
    });
  }

  static void stopTimer() {
    timer?.cancel();
  }

  static void controllerClose() {
    stopTimer();
  }
}
