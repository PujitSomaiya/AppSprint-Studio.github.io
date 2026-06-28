import 'package:appsprint_studio/src/imports/core_imports.dart';

class PackagesSection extends StatelessWidget {
  final VoidCallback? onPackageSelected;

  const PackagesSection({
    super.key,
    this.onPackageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xxxl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            children: [
              Text(
                'home.packages_title'.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: width > 768 ? 36 : 28,
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),

              // Layout
              if (width > 992)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _PackageCard(
                        titleKey: 'home.pkg1_title',
                        subtitleKey: 'home.pkg1_subtitle',
                        itemKeys: const [
                          'home.pkg1_item1',
                          'home.pkg1_item2',
                          'home.pkg1_item3',
                        ],
                        buttonLabelKey: 'home.pkg1_btn',
                        onTap: onPackageSelected,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _PackageCard(
                        titleKey: 'home.pkg2_title',
                        subtitleKey: 'home.pkg2_subtitle',
                        itemKeys: const [
                          'home.pkg2_item1',
                          'home.pkg2_item2',
                          'home.pkg2_item3',
                          'home.pkg2_item4',
                        ],
                        buttonLabelKey: 'home.pkg2_btn',
                        isHighlighted: true,
                        onTap: onPackageSelected,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _PackageCard(
                        titleKey: 'home.pkg3_title',
                        subtitleKey: 'home.pkg3_subtitle',
                        itemKeys: const [
                          'home.pkg3_item1',
                          'home.pkg3_item2',
                          'home.pkg3_item3',
                        ],
                        buttonLabelKey: 'home.pkg3_btn',
                        onTap: onPackageSelected,
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    _PackageCard(
                      titleKey: 'home.pkg1_title',
                      subtitleKey: 'home.pkg1_subtitle',
                      itemKeys: const [
                        'home.pkg1_item1',
                        'home.pkg1_item2',
                        'home.pkg1_item3',
                      ],
                      buttonLabelKey: 'home.pkg1_btn',
                      onTap: onPackageSelected,
                    ),
                    const SizedBox(height: 24),
                    _PackageCard(
                      titleKey: 'home.pkg2_title',
                      subtitleKey: 'home.pkg2_subtitle',
                      itemKeys: const [
                        'home.pkg2_item1',
                        'home.pkg2_item2',
                        'home.pkg2_item3',
                        'home.pkg2_item4',
                      ],
                      buttonLabelKey: 'home.pkg2_btn',
                      isHighlighted: true,
                      onTap: onPackageSelected,
                    ),
                    const SizedBox(height: 24),
                    _PackageCard(
                      titleKey: 'home.pkg3_title',
                      subtitleKey: 'home.pkg3_subtitle',
                      itemKeys: const [
                        'home.pkg3_item1',
                        'home.pkg3_item2',
                        'home.pkg3_item3',
                      ],
                      buttonLabelKey: 'home.pkg3_btn',
                      onTap: onPackageSelected,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PackageCard extends StatelessWidget {
  final String titleKey;
  final String subtitleKey;
  final List<String> itemKeys;
  final String buttonLabelKey;
  final bool isHighlighted;
  final VoidCallback? onTap;

  const _PackageCard({
    required this.titleKey,
    required this.subtitleKey,
    required this.itemKeys,
    required this.buttonLabelKey,
    this.isHighlighted = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;

    final cardContent = Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: isHighlighted
            ? colorScheme.surfaceContainerHighest
            : colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        border: isHighlighted
            ? null
            : Border.all(
                color: colorScheme.outlineVariant.withValues(alpha: 0.3),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleKey.tr(),
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              if (isHighlighted)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'home.package_most_popular'.tr(),
                    style: context.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onPrimary,
                      fontSize: 10,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            subtitleKey.tr(),
            style: context.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Column(
            children: itemKeys.map((itemKey) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: Row(
                  children: [
                    Icon(
                      Icons.done_rounded,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        itemKey.tr(),
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.xl),
          SizedBox(
            width: double.infinity,
            child: isHighlighted
                ? FilledButton(
                    onPressed: onTap,
                    style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppBorders.lg,
                      ),
                    ),
                    child: Text(
                      buttonLabelKey.tr(),
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  )
                : OutlinedButton(
                    onPressed: onTap,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: colorScheme.primary,
                      side: BorderSide(color: colorScheme.primary),
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppBorders.lg,
                      ),
                    ),
                    child: Text(
                      buttonLabelKey.tr(),
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );

    if (isHighlighted) {
      return Container(
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF2563EB), Color(0xFF38BDF8)],
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primaryContainer.withValues(alpha: 0.3),
              blurRadius: 30,
            ),
          ],
        ),
        child: cardContent,
      );
    }

    return cardContent;
  }
}
