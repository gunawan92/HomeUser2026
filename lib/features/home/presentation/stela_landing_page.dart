import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/components/stela_card.dart';
import '../../../design_system/tokens/stela_colors.dart';
import '../../../design_system/tokens/stela_radius.dart';
import '../../../design_system/tokens/stela_spacing.dart';

class StelaLandingPage extends StatelessWidget {
  const StelaLandingPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(StelaSpacing.md),
        children: [
          Row(
            children: [
              Image.asset('assets/branding/logo_stela.png', width: 82),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_outlined),
              ),
              IconButton(
                onPressed: () => context.go('/login'),
                icon: const Icon(Icons.account_circle_outlined),
              ),
            ],
          ),
          const SizedBox(height: StelaSpacing.lg),
          Text(
            'Selamat datang, Orang Tua',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(
            'Kelola pembayaran sekolah anak dengan mudah.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: StelaColors.textSecondary),
          ),
          const SizedBox(height: StelaSpacing.lg),
          _Banner(onTap: () => context.go('/payment')),
          const SizedBox(height: StelaSpacing.lg),
          Text(
            'Pembayaran sekolah',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: StelaSpacing.md),
          _PaymentFeatureCard(onTap: () => context.go('/payment')),
          const SizedBox(height: StelaSpacing.xl),
          Text(
            'Informasi untuk Anda',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: StelaSpacing.md),
          const StelaCard(
            child: Text('Pilih pembayaran untuk melihat tagihan setiap anak.'),
          ),
        ],
      ),
    ),
  );
}

class _Banner extends StatelessWidget {
  const _Banner({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(StelaRadius.xl),
    child: Ink(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(StelaRadius.xl),
        image: const DecorationImage(
          image: AssetImage('assets/home/bannerBayar.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

class _PaymentFeatureCard extends StatelessWidget {
  const _PaymentFeatureCard({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(StelaRadius.md),
    child: Ink(
      padding: const EdgeInsets.all(StelaSpacing.md),
      decoration: BoxDecoration(
        color: StelaColors.surface,
        borderRadius: BorderRadius.circular(StelaRadius.md),
        border: Border.all(color: StelaColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: StelaColors.warmBackground,
              borderRadius: BorderRadius.circular(StelaRadius.md),
            ),
            child: Image.asset('assets/home/pembayaran.png'),
          ),
          const SizedBox(width: StelaSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bayar tagihan anak',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Pilih anak, tinjau tagihan, lalu lanjutkan pembayaran.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: StelaColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        ],
      ),
    ),
  );
}
