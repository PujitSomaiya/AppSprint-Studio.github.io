import 'package:appsprint_studio/src/imports/core_imports.dart';
import 'package:appsprint_studio/src/imports/packages_imports.dart';

class HeroSection extends HookWidget {
  final VoidCallback? onStartProjectTap;
  final VoidCallback? onDiscussTap;

  const HeroSection({
    super.key,
    this.onStartProjectTap,
    this.onDiscussTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final isDesktop = MediaQuery.of(context).size.width > 992;

    // Animation controller for floating phone effect
    final animController = useAnimationController(
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    final floatAnimation = Tween<double>(begin: 0, end: -15).animate(animController);

    return Container(
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
                      child: _buildHeroLeft(context, colorScheme),
                    ),
                    const SizedBox(width: AppSpacing.xxl),
                    Expanded(
                      flex: 5,
                      child: _buildHeroRight(context, colorScheme, floatAnimation),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _buildHeroLeft(context, colorScheme),
                    const SizedBox(height: AppSpacing.xxl),
                    _buildHeroRight(context, colorScheme, floatAnimation),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildHeroLeft(BuildContext context, ColorScheme colorScheme) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: context.textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w900,
              color: colorScheme.onSurface,
              height: 1.15,
              fontSize: screenWidth > 768 ? 56 : 36,
            ),
            children: [
              TextSpan(text: 'home.hero_title_1'.tr()),
              TextSpan(
                text: 'home.hero_title_scale'.tr(),
                style: TextStyle(
                  color: const Color(0xFF38BDF8),
                  shadows: [
                    Shadow(
                      color: const Color(0xFF38BDF8).withValues(alpha: 0.4),
                      blurRadius: 16,
                    ),
                  ],
                ),
              ),
              TextSpan(text: 'home.hero_title_2'.tr()),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'home.hero_subtitle'.tr(),
          style: context.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.6,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            ElevatedButton(
              onPressed: onStartProjectTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF59E0B),
                foregroundColor: const Color(0xFF0B1220),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xl,
                  vertical: AppSpacing.lg,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: AppBorders.lg,
                ),
                elevation: 4,
              ),
              child: Text(
                'home.hero_start_project'.tr(),
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0B1220),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: onDiscussTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.onSurface,
                side: BorderSide(color: colorScheme.outlineVariant, width: 1.5),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xl,
                  vertical: AppSpacing.lg,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: AppBorders.lg,
                ),
              ),
              child: Text(
                'home.hero_discuss_project'.tr(),
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xxl),
        GridView.count(
          crossAxisCount: screenWidth > 480 ? 2 : 1,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 4.5,
          mainAxisSpacing: AppSpacing.xs,
          crossAxisSpacing: AppSpacing.md,
          children: const [
            _TrustPointItem(textKey: 'home.hero_trust_android_flutter'),
            _TrustPointItem(textKey: 'home.hero_trust_shopify'),
            _TrustPointItem(textKey: 'home.hero_trust_devops'),
            _TrustPointItem(textKey: 'home.hero_trust_cloud'),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroRight(
    BuildContext context,
    ColorScheme colorScheme,
    Animation<double> floatAnimation,
  ) {
    return Container(
      height: 480,
      width: double.infinity,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Background Blue Glow
          Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primaryContainer.withValues(alpha: 0.25),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primaryContainer.withValues(alpha: 0.3),
                  blurRadius: 100,
                  spreadRadius: 40,
                ),
              ],
            ),
          ),

          // DevOps Card (Back layer, slightly tilted)
          Transform.rotate(
            angle: -0.06,
            child: Container(
              width: 320,
              height: 200,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer.withValues(alpha: 0.6),
                borderRadius: AppBorders.xl,
                border: Border.all(
                  color: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(width: 10, height: 10, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent)),
                      const SizedBox(width: 6),
                      Container(width: 10, height: 10, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.amberAccent)),
                      const SizedBox(width: 6),
                      Container(width: 10, height: 10, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.greenAccent)),
                      const SizedBox(width: 12),
                      Text(
                        'ci-cd-pipeline.yaml',
                        style: TextStyle(
                          fontFamily: 'JetBrains Mono',
                          fontSize: 10,
                          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Container(height: 8, width: 200, decoration: BoxDecoration(color: colorScheme.primary.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(4))),
                  const SizedBox(height: 6),
                  Container(height: 8, width: 140, decoration: BoxDecoration(color: colorScheme.primary.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(4))),
                  const SizedBox(height: 16),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: AppBorders.md,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Shopify Store Card (Top Right, slightly tilted)
          Positioned(
            top: 20,
            right: 10,
            child: Transform.rotate(
              angle: 0.1,
              child: Container(
                width: 200,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer.withValues(alpha: 0.85),
                  borderRadius: AppBorders.xl,
                  border: Border.all(
                    color: colorScheme.secondary.withValues(alpha: 0.4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: AppBorders.md,
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: colorScheme.secondary,
                        size: 36,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Container(height: 10, width: 100, decoration: BoxDecoration(color: colorScheme.onSurfaceVariant.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(4))),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height: 14, width: 40, decoration: BoxDecoration(color: colorScheme.primary.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(4))),
                        Container(
                          width: 32,
                          height: 18,
                          decoration: BoxDecoration(
                            color: colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Animated Smartphone Frame (Front center)
          AnimatedBuilder(
            animation: floatAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, floatAnimation.value),
                child: Container(
                  width: 200,
                  height: 390,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(36),
                    border: Border.all(
                      color: colorScheme.surfaceContainerHighest,
                      width: 5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      // Inner Phone UI Mockup
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              colorScheme.primaryContainer.withValues(alpha: 0.3),
                              colorScheme.surfaceContainerLowest,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: AppSpacing.xl),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundColor: colorScheme.primary,
                                    child: Icon(Icons.person, size: 18, color: colorScheme.onPrimary),
                                  ),
                                  Icon(Icons.notifications_outlined, color: colorScheme.onSurface),
                                ],
                              ),
                              const SizedBox(height: AppSpacing.lg),
                              Text(
                                'home.hero_mockup_app_title'.tr(),
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              Text(
                                'home.hero_mockup_app_subtitle'.tr(),
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.lg),
                              Container(
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: colorScheme.primaryContainer.withValues(alpha: 0.2),
                                  borderRadius: AppBorders.lg,
                                  border: Border.all(color: colorScheme.primary.withValues(alpha: 0.3)),
                                ),
                                child: Icon(Icons.show_chart_rounded, size: 48, color: colorScheme.primary),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TrustPointItem extends StatelessWidget {
  final String textKey;

  const _TrustPointItem({required this.textKey});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    return Row(
      children: [
        Icon(
          Icons.check_circle_rounded,
          color: colorScheme.primary,
          size: 20,
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            textKey.tr(),
            style: context.textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
