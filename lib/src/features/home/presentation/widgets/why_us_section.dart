import 'package:appsprint_studio/src/imports/core_imports.dart';

class WhyUsSection extends StatelessWidget {
  const WhyUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final isDesktop = MediaQuery.of(context).size.width > 992;

    return Container(
      color: colorScheme.surfaceContainer.withValues(alpha: 0.3),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xxxl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildWhyUsLeft(context, colorScheme),
                    ),
                    const SizedBox(width: AppSpacing.xxl),
                    Expanded(
                      flex: 5,
                      child: _buildWhyUsRight(context, colorScheme),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _buildWhyUsLeft(context, colorScheme),
                    const SizedBox(height: AppSpacing.xxl),
                    _buildWhyUsRight(context, colorScheme),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildWhyUsLeft(BuildContext context, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'home.why_us_title'.tr(),
          style: context.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
            fontSize: MediaQuery.of(context).size.width > 768 ? 36 : 28,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'home.why_us_desc'.tr(),
          style: context.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.6,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: AppSpacing.xxl),
        GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width > 550 ? 2 : 1,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
          childAspectRatio: 1.6,
          children: const [
            _FeatureBox(
              icon: Icons.forum_outlined,
              titleKey: 'home.why_us_feat1_title',
              descriptionKey: 'home.why_us_feat1_desc',
            ),
            _FeatureBox(
              icon: Icons.psychology_outlined,
              titleKey: 'home.why_us_feat2_title',
              descriptionKey: 'home.why_us_feat2_desc',
            ),
            _FeatureBox(
              icon: Icons.code_rounded,
              titleKey: 'home.why_us_feat3_title',
              descriptionKey: 'home.why_us_feat3_desc',
            ),
            _FeatureBox(
              icon: Icons.speed_rounded,
              titleKey: 'home.why_us_feat4_title',
              descriptionKey: 'home.why_us_feat4_desc',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWhyUsRight(BuildContext context, ColorScheme colorScheme) {
    return Container(
      height: 380,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.surfaceContainerHigh,
            colorScheme.surfaceContainerLowest,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 30,
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppSpacing.xxl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primaryContainer.withValues(alpha: 0.2),
              border: Border.all(color: colorScheme.primary.withValues(alpha: 0.4)),
            ),
            child: Icon(
              Icons.workspace_premium_rounded,
              color: colorScheme.primary,
              size: 44,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'home.why_us_right_title'.tr(),
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'home.why_us_right_desc'.tr(),
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureBox extends StatelessWidget {
  final IconData icon;
  final String titleKey;
  final String descriptionKey;

  const _FeatureBox({
    required this.icon,
    required this.titleKey,
    required this.descriptionKey,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: AppBorders.xl,
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  titleKey.tr(),
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            descriptionKey.tr(),
            style: context.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.4,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
