import 'package:appsprint_studio/src/imports/core_imports.dart';
import 'package:appsprint_studio/src/imports/packages_imports.dart';

class SolutionsSection extends StatelessWidget {
  const SolutionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: colorScheme.surfaceContainerLowest,
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
                'home.solutions_title'.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: width > 768 ? 36 : 28,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'home.solutions_subtitle'.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),

              // Layout
              if (width > 992)
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _SolutionCard(
                        icon: Icons.smartphone_rounded,
                        accentColor: Color(0xFFB4C5FF),
                        titleKey: 'home.solution_mobile_title',
                        itemKeys: [
                          'home.solution_mobile_item_1',
                          'home.solution_mobile_item_2',
                          'home.solution_mobile_item_3',
                        ],
                      ),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: _SolutionCard(
                        icon: Icons.shopping_cart_rounded,
                        accentColor: Color(0xFF7BD0FF),
                        titleKey: 'home.solution_shopify_title',
                        itemKeys: [
                          'home.solution_shopify_item_1',
                          'home.solution_shopify_item_2',
                          'home.solution_shopify_item_3',
                        ],
                      ),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: _SolutionCard(
                        icon: Icons.settings_suggest_rounded,
                        accentColor: Color(0xFF4FDBC8),
                        titleKey: 'home.solution_devops_title',
                        itemKeys: [
                          'home.solution_devops_item_1',
                          'home.solution_devops_item_2',
                          'home.solution_devops_item_3',
                        ],
                      ),
                    ),
                  ],
                )
              else
                const Column(
                  children: [
                    _SolutionCard(
                      icon: Icons.smartphone_rounded,
                      accentColor: Color(0xFFB4C5FF),
                      titleKey: 'home.solution_mobile_title',
                      itemKeys: [
                        'home.solution_mobile_item_1',
                        'home.solution_mobile_item_2',
                        'home.solution_mobile_item_3',
                      ],
                    ),
                    SizedBox(height: 20),
                    _SolutionCard(
                      icon: Icons.shopping_cart_rounded,
                      accentColor: Color(0xFF7BD0FF),
                      titleKey: 'home.solution_shopify_title',
                      itemKeys: [
                        'home.solution_shopify_item_1',
                        'home.solution_shopify_item_2',
                        'home.solution_shopify_item_3',
                      ],
                    ),
                    SizedBox(height: 20),
                    _SolutionCard(
                      icon: Icons.settings_suggest_rounded,
                      accentColor: Color(0xFF4FDBC8),
                      titleKey: 'home.solution_devops_title',
                      itemKeys: [
                        'home.solution_devops_item_1',
                        'home.solution_devops_item_2',
                        'home.solution_devops_item_3',
                      ],
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

class _SolutionCard extends HookWidget {
  final IconData icon;
  final Color accentColor;
  final String titleKey;
  final List<String> itemKeys;

  const _SolutionCard({
    required this.icon,
    required this.accentColor,
    required this.titleKey,
    required this.itemKeys,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final isHovered = useState(false);

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: AnimatedContainer(
        duration: AppDurations.fast,
        padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isHovered.value
                ? accentColor.withValues(alpha: 0.6)
                : colorScheme.outlineVariant.withValues(alpha: 0.3),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: accentColor,
                size: 28,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              titleKey.tr(),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Column(
              children: itemKeys.map((itemKey) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: accentColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          itemKey.tr(),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                Text(
                  'home.solutions_explore'.tr(),
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: accentColor,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
