import 'package:flutter_talk/counter_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve contar de 0 até 2', () {
    // Arrange:
    final controller = CounterController();
    
    // Act:
    controller.increment();
    controller.increment();

    // Assert:
    expect(controller.value, 2);
  });
}
