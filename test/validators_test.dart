import 'package:flutter_test/flutter_test.dart';

import 'package:heart_attack_ethiopia/core/utils/validators.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/bloc/login_cubit.dart';

void main() {
  group('Validators', () {
    test('accepts a valid email', () {
      expect(Validators.isValidEmail('demo@template.dev'), isTrue);
    });

    test('rejects an invalid email', () {
      expect(Validators.isValidEmail('demo@template'), isFalse);
    });
  });

  group('LoginState', () {
    test('starts with valid demo credentials', () {
      final state = LoginState.initial();

      expect(state.isValid, isTrue);
      expect(state.email.value, 'demo@template.dev');
      expect(state.password.value, 'Password123');
    });
  });
}
