import 'package:flutter/material.dart';
import 'dart:html' as html;

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final currentYear = DateTime.now().year;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 40,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF0D1B2A),
        border: Border(
          top: BorderSide(
            color: Color(0xFF2D3A4F),
            width: 1,
          ),
        ),
      ),
      child: isMobile
          ? Column(
              children: [
                _buildLogo(),
                const SizedBox(height: 24),
                _buildSocialLinks(),
                const SizedBox(height: 24),
                _buildCopyright(currentYear),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLogo(),
                _buildSocialLinks(),
                _buildCopyright(currentYear),
              ],
            ),
    );
  }

  Widget _buildLogo() {
    return const Text(
      'Luis Fernando Alvarez',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4ECDC4),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSocialIcon(Icons.link, 'LinkedIn', () => _openLink('https://www.linkedin.com/in/luisfernandoalvarezcanales/')),
        const SizedBox(width: 16),
        _buildSocialIcon(Icons.camera_alt_rounded, 'Instagram', () => _openLink('https://www.instagram.com/sanfernandodev/')),
        const SizedBox(width: 16),
        _buildSocialIcon(Icons.message_rounded, 'WhatsApp', () => _openLink('https://wa.me/50499056589')),
        const SizedBox(width: 16),
        _buildSocialIcon(Icons.code_rounded, 'GitHub', () => _openLink('https://github.com/sanfernandodev')),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String tooltip, VoidCallback onTap) {
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF1B263B),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.white.withOpacity(0.7),
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCopyright(int year) {
    return Text(
      '© $year Luis Fernando Alvarez. Todos los derechos reservados.',
      style: TextStyle(
        fontSize: 14,
        color: Colors.white.withOpacity(0.5),
      ),
    );
  }

  void _openLink(String url) {
    html.window.open(url, '_blank');
  }
}
