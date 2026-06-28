import 'package:appsprint_studio/src/imports/core_imports.dart';
import 'package:appsprint_studio/src/imports/packages_imports.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount = 3;
    if (width < 768) {
      crossAxisCount = 1;
    } else if (width < 1024) {
      crossAxisCount = 2;
    }

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
              // Header
              Text(
                'home.services_eyebrow'.tr(),
                style: context.textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'home.services_title'.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: width > 768 ? 36 : 28,
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),

              // Grid
              GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: AppSpacing.lg,
                crossAxisSpacing: AppSpacing.lg,
                childAspectRatio: width < 600 ? 1.4 : (width < 1024 ? 1.5 : 1.3),
                children: const [
                  _ServiceCard(
                    icon: Icons.android_rounded,
                    iconColor: Color(0xFFB4C5FF),
                    titleKey: 'home.service_android_title',
                    descriptionKey: 'home.service_android_desc',
                  ),
                  _ServiceCard(
                    icon: Icons.phone_iphone_rounded,
                    iconColor: Color(0xFF7BD0FF),
                    titleKey: 'home.service_flutter_title',
                    descriptionKey: 'home.service_flutter_desc',
                  ),
                  _ServiceCard(
                    icon: Icons.shopping_bag_outlined,
                    iconColor: Color(0xFF4FDBC8),
                    titleKey: 'home.service_shopify_title',
                    descriptionKey: 'home.service_shopify_desc',
                  ),
                  _ServiceCard(
                    icon: Icons.terminal_rounded,
                    iconColor: Color(0xFFFFB4AB),
                    titleKey: 'home.service_devops_title',
                    descriptionKey: 'home.service_devops_desc',
                  ),
                  _ServiceCard(
                    icon: Icons.cloud_done_outlined,
                    iconColor: Color(0xFFB4C5FF),
                    titleKey: 'home.service_cloud_title',
                    descriptionKey: 'home.service_cloud_desc',
                  ),
                  _ServiceCard(
                    icon: Icons.build_outlined,
                    iconColor: Color(0xFF7BD0FF),
                    titleKey: 'home.service_maintenance_title',
                    descriptionKey: 'home.service_maintenance_desc',
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

class _ServiceCard extends HookWidget {
  final IconData icon;
  final Color iconColor;
  final String titleKey;
  final String descriptionKey;

  const _ServiceCard({
    required this.icon,
    required this.iconColor,
    required this.titleKey,
    required this.descriptionKey,
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
        transform: Matrix4.translationValues(0, isHovered.value ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainer.withValues(alpha: 0.7),
          borderRadius: AppBorders.xl,
          border: Border.all(
            color: isHovered.value
                ? colorScheme.primary.withValues(alpha: 0.4)
                : colorScheme.outlineVariant.withValues(alpha: 0.3),
            width: 1.5,
          ),
          boxShadow: isHovered.value
              ? [
                  BoxShadow(
                    color: colorScheme.primaryContainer.withValues(alpha: 0.15),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: iconColor,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              titleKey.tr(),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Expanded(
              child: Text(
                descriptionKey.tr(),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.5,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
