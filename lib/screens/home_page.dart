import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/services_section.dart';
import '../widgets/portfolio_section.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/fade_in_on_scroll.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  
  // Keys para cada sección
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(
              key: _heroKey,
              onNavigate: (section) {
                switch (section) {
                  case 'inicio':
                    _scrollToSection(_heroKey);
                    break;
                  case 'servicios':
                    _scrollToSection(_servicesKey);
                    break;
                  case 'proyectos':
                    _scrollToSection(_portfolioKey);
                    break;
                  case 'sobre':
                    _scrollToSection(_aboutKey);
                    break;
                  case 'contacto':
                    _scrollToSection(_contactKey);
                    break;
                }
              },
            ),
            FadeInOnScroll(
              child: ServicesSection(key: _servicesKey),
            ),
            FadeInOnScroll(
              delay: const Duration(milliseconds: 100),
              child: PortfolioSection(key: _portfolioKey),
            ),
            FadeInOnScroll(
              delay: const Duration(milliseconds: 100),
              child: AboutSection(key: _aboutKey),
            ),
            FadeInOnScroll(
              delay: const Duration(milliseconds: 100),
              child: ContactSection(key: _contactKey),
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
