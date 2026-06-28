import 'package:appsprint_studio/src/imports/core_imports.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: colorScheme.surfaceContainer,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xxxl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              Text(
                'home.exp_title'.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: width > 768 ? 32 : 24,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'home.exp_desc'.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.6,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              Wrap(
                spacing: width > 600 ? 60 : 30,
                runSpacing: AppSpacing.lg,
                alignment: WrapAlignment.center,
                children: const [
                  _StatCounter(numberKey: 'home.exp_stat1_num', labelKey: 'home.exp_stat1_label'),
                  _StatCounter(numberKey: 'home.exp_stat2_num', labelKey: 'home.exp_stat2_label'),
                  _StatCounter(numberKey: 'home.exp_stat3_num', labelKey: 'home.exp_stat3_label'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCounter extends StatelessWidget {
  final String numberKey;
  final String labelKey;

  const _StatCounter({
    required this.numberKey,
    required this.labelKey,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    return Column(
      children: [
        Text(
          numberKey.tr(),
          style: context.textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.w900,
            color: colorScheme.onSurface,
            fontSize: 40,
          ),
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          labelKey.tr(),
          style: context.textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
