import 'package:appsprint_studio/src/imports/core_imports.dart';

class FooterSection extends StatelessWidget {
  final VoidCallback? onServicesTap;
  final VoidCallback? onWhyUsTap;
  final VoidCallback? onProcessTap;

  const FooterSection({
    super.key,
    this.onServicesTap,
    this.onWhyUsTap,
    this.onProcessTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        border: Border(
          top: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xxxl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: width > 768
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBrandColumn(context, colorScheme),
                    _buildLinksGrid(context, colorScheme),
                  ],
                )
              : Column(
                  children: [
                    _buildBrandColumn(context, colorScheme),
                    const SizedBox(height: AppSpacing.xxl),
                    _buildLinksGrid(context, colorScheme),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildBrandColumn(BuildContext context, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment:
          MediaQuery.of(context).size.width > 768 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 32,
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
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'home.footer_copyright'.tr(namedArgs: {'year': '${DateTime.now().year}'}),
          textAlign: MediaQuery.of(context).size.width > 768 ? TextAlign.left : TextAlign.center,
          style: context.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildLinksGrid(BuildContext context, ColorScheme colorScheme) {
    return Wrap(
      spacing: 48,
      runSpacing: AppSpacing.xl,
      children: [
        _FooterLinkGroup(
          titleKey: 'home.nav_services',
          links: [
            _FooterLink(labelKey: 'home.footer_mobile_apps', onTap: onServicesTap),
            _FooterLink(labelKey: 'home.footer_shopify_stores', onTap: onServicesTap),
            _FooterLink(labelKey: 'home.footer_devops_setup', onTap: onServicesTap),
          ],
        ),
        _FooterLinkGroup(
          titleKey: 'home.footer_company',
          links: [
            _FooterLink(labelKey: 'home.footer_why_us', onTap: onWhyUsTap),
            _FooterLink(labelKey: 'home.nav_process', onTap: onProcessTap),
          ],
        ),
        const _FooterLinkGroup(
          titleKey: 'home.footer_legal',
          links: [
            _FooterLink(labelKey: 'home.footer_privacy'),
            _FooterLink(labelKey: 'home.footer_terms'),
          ],
        ),
      ],
    );
  }
}

class _FooterLinkGroup extends StatelessWidget {
  final String titleKey;
  final List<_FooterLink> links;

  const _FooterLinkGroup({
    required this.titleKey,
    required this.links,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleKey.tr(),
          style: context.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: GestureDetector(
                onTap: link.onTap,
                child: Text(
                  link.labelKey.tr(),
                  style: context.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 14,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}

class _FooterLink {
  final String labelKey;
  final VoidCallback? onTap;

  const _FooterLink({required this.labelKey, this.onTap});
}
