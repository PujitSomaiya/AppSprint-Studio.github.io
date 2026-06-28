import 'package:appsprint_studio/src/imports/core_imports.dart';

class FinalCtaSection extends StatelessWidget {
  final VoidCallback? onCtaTap;

  const FinalCtaSection({
    super.key,
    this.onCtaTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xxxl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width > 768 ? 60 : 24,
              vertical: width > 768 ? 80 : 48,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF2563EB),
                  Color(0xFF0B1220),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2563EB).withValues(alpha: 0.3),
                  blurRadius: 40,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'home.cta_title'.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InterVariable',
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: width > 768 ? 44 : 28,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 640),
                  child: Text(
                    'home.cta_desc'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InterVariable',
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.xxl),
                ElevatedButton(
                  onPressed: onCtaTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF59E0B),
                    foregroundColor: const Color(0xFF0B1220),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    shape: const StadiumBorder(),
                    elevation: 6,
                  ),
                  child: Text(
                    'home.cta_btn'.tr(),
                    style: const TextStyle(
                      fontFamily: 'InterVariable',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B1220),
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
