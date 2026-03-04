import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1200;

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
            'Mis Servicios',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4ECDC4),
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Soluciones digitales\npara tu negocio',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 60),
          // Services grid
          _buildServicesGrid(context, isMobile, isTablet),
        ],
      ),
    );
  }

  Widget _buildServicesGrid(BuildContext context, bool isMobile, bool isTablet) {
    final services = [
      ServiceItem(
        icon: Icons.web_rounded,
        title: 'Desarrollo Web',
        description: 'Sitios web modernos, rápidos y responsivos. Desde landing pages hasta e-commerce completos.',
        color: const Color(0xFF4ECDC4),
      ),
      ServiceItem(
        icon: Icons.phone_iphone_rounded,
        title: 'Apps Móviles',
        description: 'Aplicaciones nativas para iOS y Android con Flutter. Una sola base de código, ambas plataformas.',
        color: const Color(0xFF6C63FF),
      ),
      ServiceItem(
        icon: Icons.favorite_rounded,
        title: 'Invitaciones Digitales',
        description: 'Invitaciones web para bodas, XV años, bautizos y cualquier evento especial. Elegantes y personalizadas.',
        color: const Color(0xFFFF6B6B),
      ),
      ServiceItem(
        icon: Icons.brush_rounded,
        title: 'Plantillas Web',
        description: 'Templates personalizables para tu negocio. Diseños profesionales listos para usar.',
        color: const Color(0xFFFBBF24),
      ),
      ServiceItem(
        icon: Icons.computer_rounded,
        title: 'Soporte Técnico',
        description: 'Instalación de Windows, Office, licencias de software y configuración de equipos.',
        color: const Color(0xFF10B981),
      ),
      ServiceItem(
        icon: Icons.cloud_rounded,
        title: 'Escritorio Remoto',
        description: 'Configuración de acceso remoto (RDP), VPN y soluciones de trabajo desde casa.',
        color: const Color(0xFF3B82F6),
      ),
      ServiceItem(
        icon: Icons.palette_rounded,
        title: 'Diseño & Branding',
        description: 'Logos, identidad visual y diseño gráfico para dar vida a tu marca.',
        color: const Color(0xFFEC4899),
      ),
      ServiceItem(
        icon: Icons.school_rounded,
        title: 'Capacitación',
        description: 'Tutorías personalizadas en programación, herramientas digitales y tecnología.',
        color: const Color(0xFF8B5CF6),
      ),
    ];

    // En móvil usamos Column para altura flexible
    if (isMobile) {
      return Column(
        children: services.map((service) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildServiceCard(service, isMobile: true),
        )).toList(),
      );
    }

    int crossAxisCount = isTablet ? 2 : 4;
    double childAspectRatio = isTablet ? 1.3 : 1.1;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return _buildServiceCard(services[index]);
      },
    );
  }

  Widget _buildServiceCard(ServiceItem service, {bool isMobile = false}) {
    if (isMobile) {
      // Layout horizontal para móvil
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF253449),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF2D3A4F),
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: service.color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                service.icon,
                color: service.color,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    service.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.7),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Layout vertical para tablet/desktop
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: service.color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                service.icon,
                color: service.color,
                size: 28,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              service.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                service.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.7),
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceItem {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  ServiceItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}
