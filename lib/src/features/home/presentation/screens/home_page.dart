import 'package:appsprint_studio/src/imports/core_imports.dart';
import 'package:appsprint_studio/src/imports/packages_imports.dart';
import 'package:appsprint_studio/src/services/url_launcher_service.dart';

import '../widgets/experience_section.dart';
import '../widgets/faq_section.dart';
import '../widgets/final_cta_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/nav_header.dart';
import '../widgets/packages_section.dart';
import '../widgets/process_section.dart';
import '../widgets/services_section.dart';
import '../widgets/solutions_section.dart';
import '../widgets/why_us_section.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final scrollController = useScrollController();

    // Keys to target sections for smooth scrolling
    final servicesKey = useMemoized(() => GlobalKey());
    final solutionsKey = useMemoized(() => GlobalKey());
    final whyUsKey = useMemoized(() => GlobalKey());
    final processKey = useMemoized(() => GlobalKey());
    final packagesKey = useMemoized(() => GlobalKey());
    final contactKey = useMemoized(() => GlobalKey());

    void scrollToKey(GlobalKey key) {
      final keyContext = key.currentContext;
      if (keyContext != null) {
        Scrollable.ensureVisible(
          keyContext,
          duration: AppDurations.slow,
          curve: AppCurves.standard,
        );
      }
    }

    void scrollToTop() {
      scrollController.animateTo(
        0,
        duration: AppDurations.slow,
        curve: AppCurves.standard,
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  // Space for sticky fixed header
                  const SizedBox(height: 70),

                  // Hero Section
                  HeroSection(
                    onStartProjectTap: () => scrollToKey(contactKey),
                    onDiscussTap: () => scrollToKey(contactKey),
                  ),

                  // Services Section
                  KeyedSubtree(
                    key: servicesKey,
                    child: const ServicesSection(),
                  ),

                  // Solutions Section
                  KeyedSubtree(
                    key: solutionsKey,
                    child: const SolutionsSection(),
                  ),

                  // Why Us Section
                  KeyedSubtree(
                    key: whyUsKey,
                    child: const WhyUsSection(),
                  ),

                  // Process Section
                  KeyedSubtree(
                    key: processKey,
                    child: const ProcessSection(),
                  ),

                  // Experience Section
                  const ExperienceSection(),

                  // Packages Section
                  KeyedSubtree(
                    key: packagesKey,
                    child: PackagesSection(
                      onPackageSelected: () => scrollToKey(contactKey),
                    ),
                  ),

                  // FAQ Section
                  const FaqSection(),

                  // Final CTA Banner
                  KeyedSubtree(
                    key: contactKey,
                    child: FinalCtaSection(
                      onCtaTap: () {
                        UrlLauncherService.instance
                            .launch('https://forms.gle/shhjWq6Tx8JvUTeM8');
                      },
                    ),
                  ),

                  // Footer
                  FooterSection(
                    onServicesTap: () => scrollToKey(servicesKey),
                    onWhyUsTap: () => scrollToKey(whyUsKey),
                    onProcessTap: () => scrollToKey(processKey),
                  ),
                ],
              ),
            ),

            // Fixed Sticky Header
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: NavHeader(
                onHomeTap: scrollToTop,
                onServicesTap: () => scrollToKey(servicesKey),
                onSolutionsTap: () => scrollToKey(solutionsKey),
                onProcessTap: () => scrollToKey(processKey),
                onPackagesTap: () => scrollToKey(packagesKey),
                onContactTap: () => scrollToKey(contactKey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
