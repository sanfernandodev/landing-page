import 'package:flutter/material.dart';
import 'dart:html' as html;

class HeroSection extends StatelessWidget {
  final Function(String)? onNavigate;
  
  const HeroSection({super.key, this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0D1B2A),
            Color(0xFF1B263B),
            Color(0xFF0D1B2A),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background decorations
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF4ECDC4).withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -150,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF6C63FF).withOpacity(0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: 40,
            ),
            child: Column(
              children: [
                // Navigation
                _buildNavBar(context, isMobile),
                SizedBox(height: isMobile ? 60 : 100),
                // Hero content
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 0 : screenWidth * 0.1,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Hola, soy Luis Fernando 👋',
                        style: TextStyle(
                          fontSize: isMobile ? 18 : 24,
                          color: const Color(0xFF4ECDC4),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Transformo ideas en\nexperiencias digitales',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 36 : 64,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Desarrollo web, aplicaciones móviles y soporte técnico\npara llevar tu negocio al siguiente nivel.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 20,
                          color: Colors.white.withOpacity(0.7),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 48),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: [
                          _buildPrimaryButton(
                            'Ver Servicios',
                            Icons.arrow_downward_rounded,
                            () => onNavigate?.call('servicios'),
                          ),
                          _buildSecondaryButton(
                            'Contáctame',
                            Icons.send_rounded,
                            () => _openWhatsApp(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      // Stats
                      Wrap(
                        spacing: isMobile ? 24 : 80,
                        runSpacing: 24,
                        alignment: WrapAlignment.center,
                        children: [
                          _buildStat('8+', 'Años de\nexperiencia'),
                          _buildStat('100%', 'Compromiso\ncon tu proyecto'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBar(BuildContext context, bool isMobile) {
    if (isMobile) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'FA',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4ECDC4),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 28),
            onPressed: () {
              _showMobileMenu(context);
            },
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Luis Fernando Alvarez',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4ECDC4),
          ),
        ),
        Row(
          children: [
            _buildNavLink('Inicio', () => onNavigate?.call('inicio')),
            _buildNavLink('Servicios', () => onNavigate?.call('servicios')),
            _buildNavLink('Proyectos', () => onNavigate?.call('proyectos')),
            _buildNavLink('Sobre mí', () => onNavigate?.call('sobre')),
            _buildNavLink('Contacto', () => onNavigate?.call('contacto')),
          ],
        ),
      ],
    );
  }

  Widget _buildNavLink(String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton(String text, IconData icon, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF4ECDC4), Color(0xFF26A69A)],
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4ECDC4).withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Icon(icon, color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(String text, IconData icon, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Icon(icon, color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4ECDC4),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.6),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  void _openWhatsApp() {
    html.window.open(
      'https://wa.me/50499056589?text=Hola,%20me%20interesa%20conocer%20más%20sobre%20tus%20servicios',
      '_blank',
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1B263B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            _buildMobileMenuItem(context, 'Inicio', Icons.home_rounded, 'inicio'),
            _buildMobileMenuItem(context, 'Servicios', Icons.code_rounded, 'servicios'),
            _buildMobileMenuItem(context, 'Proyectos', Icons.work_rounded, 'proyectos'),
            _buildMobileMenuItem(context, 'Sobre mí', Icons.person_rounded, 'sobre'),
            _buildMobileMenuItem(context, 'Contacto', Icons.email_rounded, 'contacto'),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMenuItem(BuildContext context, String title, IconData icon, String section) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF4ECDC4)),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        onNavigate?.call(section);
      },
    );
  }
}
