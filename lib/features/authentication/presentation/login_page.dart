import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design_system/components/stela_primary_button.dart';
import '../../../design_system/tokens/stela_colors.dart';
import '../../../design_system/tokens/stela_radius.dart';
import '../../../design_system/tokens/stela_spacing.dart';
import '../application/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    ref.listen(authControllerProvider, (previous, next) {
      if (next.hasValue && next.valueOrNull != null) context.go('/');
    });
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(StelaSpacing.lg),
          children: [
            const SizedBox(height: 40),
            Center(
              child: Image.asset('assets/branding/logo_stela.png', width: 128),
            ),
            const SizedBox(height: 40),
            Text(
              'Selamat datang',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: StelaSpacing.sm),
            Text(
              'Masuk untuk terhubung dengan informasi sekolah dan pembayaran anak.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: StelaSpacing.xl),
            TextField(
              controller: _username,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: StelaSpacing.md),
            TextField(
              controller: _password,
              obscureText: _obscurePassword,
              onSubmitted: (_) => _signIn(),
              decoration: InputDecoration(
                labelText: 'Kata sandi',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Lupa kata sandi?'),
              ),
            ),
            const SizedBox(height: StelaSpacing.md),
            if (auth.hasError) ...[
              const SizedBox(height: StelaSpacing.sm),
              Text(
                auth.error.toString(),
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: StelaColors.danger),
              ),
            ],
            StelaPrimaryButton(
              label: 'Masuk',
              isLoading: auth.isLoading,
              onPressed: auth.isLoading ? null : _signIn,
            ),
            const SizedBox(height: StelaSpacing.lg),
            Container(
              padding: const EdgeInsets.all(StelaSpacing.md),
              decoration: BoxDecoration(
                color: StelaColors.warmBackground,
                borderRadius: BorderRadius.circular(StelaRadius.md),
              ),
              child: Text(
                'Terhubung ke server pengembangan STELA melalui jaringan lokal.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    if (_username.text.trim().isEmpty || _password.text.isEmpty) return;
    await ref
        .read(authControllerProvider.notifier)
        .signIn(_username.text.trim(), _password.text);
  }
}
