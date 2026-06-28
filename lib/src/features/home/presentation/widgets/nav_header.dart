import 'dart:ui';
import 'package:appsprint_studio/src/imports/core_imports.dart';
import 'package:appsprint_studio/src/imports/packages_imports.dart';

class NavHeader extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onSolutionsTap;
  final VoidCallback? onProcessTap;
  final VoidCallback? onPackagesTap;
  final VoidCallback? onContactTap;

  const NavHeader({
    super.key,
    this.onHomeTap,
    this.onServicesTap,
    this.onSolutionsTap,
    this.onProcessTap,
    this.onPackagesTap,
    this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface.withValues(alpha: 0.8),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo + Title
                  GestureDetector(
                    onTap: onHomeTap,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorScheme.primaryContainer,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              AppAssets.logo,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          'home.nav_app_title'.tr(),
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: colorScheme.onSurface,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Desktop Nav Links
                  if (MediaQuery.of(context).size.width > 768)
                    Row(
                      children: [
                        _NavTextButton(labelKey: 'home.nav_home', isSelected: true, onTap: onHomeTap),
                        _NavTextButton(labelKey: 'home.nav_services', onTap: onServicesTap),
                        _NavTextButton(labelKey: 'home.nav_solutions', onTap: onSolutionsTap),
                        _NavTextButton(labelKey: 'home.nav_process', onTap: onProcessTap),
                        _NavTextButton(labelKey: 'home.nav_packages', onTap: onPackagesTap),
                        _NavTextButton(labelKey: 'home.nav_contact', onTap: onContactTap),
                      ],
                    ),

                  // CTA Button
                  FilledButton(
                    onPressed: onContactTap,
                    style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.primaryContainer,
                      foregroundColor: colorScheme.onPrimaryContainer,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.md,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppBorders.lg,
                      ),
                    ),
                    child: Text(
                      'home.nav_start_project'.tr(),
                      style: context.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavTextButton extends HookWidget {
  final String labelKey;
  final bool isSelected;
  final VoidCallback? onTap;

  const _NavTextButton({
    required this.labelKey,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final isHovered = useState(false);

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: AnimatedContainer(
            duration: AppDurations.fast,
            padding: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isSelected
                      ? colorScheme.primary
                      : (isHovered.value ? colorScheme.primary.withValues(alpha: 0.5) : Colors.transparent),
                  width: 2,
                ),
              ),
            ),
            child: Text(
              labelKey.tr(),
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected || isHovered.value
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
