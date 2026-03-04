import 'package:flutter/material.dart';
import 'dart:html' as html;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF1B263B),
      ),
      child: Column(
        children: [
          // Section header
          const Text(
            'Contacto',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4ECDC4),
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '¿Tienes un proyecto en mente?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Escríbeme y hagamos realidad tu idea',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 60),
          // Contact cards
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildContactCard(
                icon: Icons.email_rounded,
                title: 'Email',
                value: 'fernando.alvarez.c@outlook.com',
                color: const Color(0xFF4ECDC4),
                onTap: () => _openEmail(),
              ),
              _buildContactCard(
                icon: Icons.phone_rounded,
                title: 'WhatsApp',
                value: '+504 9905-6589',
                color: const Color(0xFF25D366),
                onTap: () => _openWhatsApp(),
              ),
              _buildContactCard(
                icon: Icons.telegram,
                title: 'Telegram',
                value: '+504 9905-6589',
                color: const Color(0xFF0088CC),
                onTap: () => _openTelegram(),
              ),
            ],
          ),
          const SizedBox(height: 60),
          // CTA Button
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => _openWhatsApp(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4ECDC4), Color(0xFF26A69A)],
                  ),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4ECDC4).withOpacity(0.4),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.send_rounded, color: Colors.white),
                    SizedBox(width: 12),
                    Text(
                      '¡Empecemos a trabajar juntos!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 280,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: const Color(0xFF253449),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF2D3A4F),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 32,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openWhatsApp() {
    html.window.open(
      'https://wa.me/50499056589?text=Hola,%20me%20interesa%20conocer%20más%20sobre%20tus%20servicios',
      '_blank',
    );
  }

  void _openEmail() {
    html.window.open(
      'mailto:fernando.alvarez.c@outlook.com?subject=Consulta%20de%20Servicios',
      '_blank',
    );
  }

  void _openTelegram() {
    html.window.open(
      'https://t.me/+50499056589',
      '_blank',
    );
  }
}
