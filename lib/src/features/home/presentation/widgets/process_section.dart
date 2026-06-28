import 'package:appsprint_studio/src/imports/core_imports.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

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
                'home.process_title'.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: width > 768 ? 36 : 28,
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),

              // Steps Row or Grid
              if (width > 992)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Connecting Gradient Line
                    Positioned(
                      top: 24,
                      left: 40,
                      right: 40,
                      child: Container(
                        height: 2,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF2563EB),
                              Color(0xFF38BDF8),
                              Color(0xFF4FDBC8),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _ProcessStep(
                            stepNumber: '1',
                            titleKey: 'home.process_step1_title',
                            descriptionKey: 'home.process_step1_desc',
                            isHighlighted: true,
                          ),
                        ),
                        Expanded(
                          child: _ProcessStep(
                            stepNumber: '2',
                            titleKey: 'home.process_step2_title',
                            descriptionKey: 'home.process_step2_desc',
                          ),
                        ),
                        Expanded(
                          child: _ProcessStep(
                            stepNumber: '3',
                            titleKey: 'home.process_step3_title',
                            descriptionKey: 'home.process_step3_desc',
                          ),
                        ),
                        Expanded(
                          child: _ProcessStep(
                            stepNumber: '4',
                            titleKey: 'home.process_step4_title',
                            descriptionKey: 'home.process_step4_desc',
                          ),
                        ),
                        Expanded(
                          child: _ProcessStep(
                            stepNumber: '5',
                            titleKey: 'home.process_step5_title',
                            descriptionKey: 'home.process_step5_desc',
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              else
                const Column(
                  children: [
                    _ProcessStepVertical(
                      stepNumber: '1',
                      titleKey: 'home.process_step1_title',
                      descriptionKey: 'home.process_step1_desc',
                      isHighlighted: true,
                    ),
                    _ProcessStepVertical(
                      stepNumber: '2',
                      titleKey: 'home.process_step2_title',
                      descriptionKey: 'home.process_step2_desc',
                    ),
                    _ProcessStepVertical(
                      stepNumber: '3',
                      titleKey: 'home.process_step3_title',
                      descriptionKey: 'home.process_step3_desc',
                    ),
                    _ProcessStepVertical(
                      stepNumber: '4',
                      titleKey: 'home.process_step4_title',
                      descriptionKey: 'home.process_step4_desc',
                    ),
                    _ProcessStepVertical(
                      stepNumber: '5',
                      titleKey: 'home.process_step5_title',
                      descriptionKey: 'home.process_step5_desc',
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

class _ProcessStep extends StatelessWidget {
  final String stepNumber;
  final String titleKey;
  final String descriptionKey;
  final bool isHighlighted;

  const _ProcessStep({
    required this.stepNumber,
    required this.titleKey,
    required this.descriptionKey,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isHighlighted
                ? const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF38BDF8)],
                  )
                : null,
            color: isHighlighted ? null : colorScheme.surfaceContainerHigh,
            border: isHighlighted
                ? null
                : Border.all(
                    color: colorScheme.primary.withValues(alpha: 0.4),
                    width: 2,
                  ),
            boxShadow: isHighlighted
                ? [
                    BoxShadow(
                      color: const Color(0xFF2563EB).withValues(alpha: 0.4),
                      blurRadius: 16,
                    ),
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            stepNumber,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: isHighlighted ? Colors.white : colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          titleKey.tr(),
          textAlign: TextAlign.center,
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
          child: Text(
            descriptionKey.tr(),
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.4,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProcessStepVertical extends StatelessWidget {
  final String stepNumber;
  final String titleKey;
  final String descriptionKey;
  final bool isHighlighted;

  const _ProcessStepVertical({
    required this.stepNumber,
    required this.titleKey,
    required this.descriptionKey,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isHighlighted
                  ? const LinearGradient(
                      colors: [Color(0xFF2563EB), Color(0xFF38BDF8)],
                    )
                  : null,
              color: isHighlighted ? null : colorScheme.surfaceContainerHigh,
              border: isHighlighted
                  ? null
                  : Border.all(
                      color: colorScheme.primary.withValues(alpha: 0.4),
                      width: 2,
                    ),
            ),
            alignment: Alignment.center,
            child: Text(
              stepNumber,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isHighlighted ? Colors.white : colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleKey.tr(),
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                    fontSize: 16,
                  ),
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
          ),
        ],
      ),
    );
  }
}
