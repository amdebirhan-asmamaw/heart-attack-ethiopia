import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/localization/generated/strings.g.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/login_cubit.dart';
import '../widgets/auth_header.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/loading_overlay.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginCubit>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.failure &&
            state.errorMessage != null) {
          context.showAppSnackBar(state.errorMessage!);
        }

        if (state.status == FormzSubmissionStatus.success &&
            state.session != null) {
          context.read<AuthCubit>().applySession(state.session!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: LoadingOverlay(
            isLoading: state.status == FormzSubmissionStatus.inProgress,
            child: SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 440),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AuthHeader(),
                            const SizedBox(height: 24),
                            AppTextField(
                              label: context.t.strings.auth.emailLabel,
                              hintText: context.t.strings.auth.emailHint,
                              keyboardType: TextInputType.emailAddress,
                              initialValue: state.email.value,
                              errorText: state.emailError,
                              onChanged: context
                                  .read<LoginCubit>()
                                  .emailChanged,
                            ),
                            const SizedBox(height: 16),
                            AppTextField(
                              label: context.t.strings.auth.passwordLabel,
                              hintText: context.t.strings.auth.passwordHint,
                              obscureText: true,
                              initialValue: state.password.value,
                              errorText: state.passwordError,
                              onChanged: context
                                  .read<LoginCubit>()
                                  .passwordChanged,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              context.t.strings.auth.demoHint,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: AppButton(
                                label: context.t.strings.auth.submit,
                                isLoading:
                                    state.status ==
                                    FormzSubmissionStatus.inProgress,
                                onPressed: () {
                                  context.read<LoginCubit>().submit();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
