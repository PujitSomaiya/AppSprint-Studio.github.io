import 'package:appsprint_studio/src/imports/core_imports.dart';
import 'package:appsprint_studio/src/imports/packages_imports.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

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
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              Text(
                'home.faq_title'.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: width > 768 ? 36 : 28,
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              const _FaqItem(
                questionKey: 'home.faq1_q',
                answerKey: 'home.faq1_a',
              ),
              const SizedBox(height: AppSpacing.md),
              const _FaqItem(
                questionKey: 'home.faq2_q',
                answerKey: 'home.faq2_a',
              ),
              const SizedBox(height: AppSpacing.md),
              const _FaqItem(
                questionKey: 'home.faq3_q',
                answerKey: 'home.faq3_a',
              ),
              const SizedBox(height: AppSpacing.md),
              const _FaqItem(
                questionKey: 'home.faq4_q',
                answerKey: 'home.faq4_a',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FaqItem extends HookWidget {
  final String questionKey;
  final String answerKey;

  const _FaqItem({
    required this.questionKey,
    required this.answerKey,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final isExpanded = useState(false);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer.withValues(alpha: 0.8),
        borderRadius: AppBorders.xl,
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          onExpansionChanged: (val) => isExpanded.value = val,
          tilePadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.sm,
          ),
          iconColor: colorScheme.primary,
          collapsedIconColor: colorScheme.onSurfaceVariant,
          title: Text(
            questionKey.tr(),
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
              fontSize: 18,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: AppSpacing.xl,
                right: AppSpacing.xl,
                bottom: AppSpacing.xl,
              ),
              child: Text(
                answerKey.tr(),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.6,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
