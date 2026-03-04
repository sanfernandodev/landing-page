import 'package:flutter/material.dart';
import 'dart:html' as html;

class ProjectItem {
  final String title;
  final String category;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> technologies;
  final String? demoUrl;

  ProjectItem({
    required this.title,
    required this.category,
    required this.description,
    required this.icon,
    required this.color,
    required this.technologies,
    this.demoUrl,
  });
}

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1200;

    final projects = [
      ProjectItem(
        title: 'App de Finanzas Personales',
        category: 'Aplicación Móvil',
        description: 'Control de gastos e ingresos con gráficos, categorías y reportes mensuales. Sincronización en la nube.',
        icon: Icons.account_balance_wallet_rounded,
        color: const Color(0xFF4ECDC4),
        technologies: ['Flutter', 'Firebase', 'Charts'],
      ),
      ProjectItem(
        title: 'E-Commerce con Panel Admin',
        category: 'Sitio Web',
        description: 'Tienda online completa con carrito, pagos, inventario y dashboard administrativo.',
        icon: Icons.shopping_cart_rounded,
        color: const Color(0xFF6C63FF),
        technologies: ['React', 'Node.js', 'MongoDB'],
      ),
      ProjectItem(
        title: 'Sistema de Reservaciones',
        category: 'Aplicación Web',
        description: 'Plataforma de citas para salones, clínicas o restaurantes con calendario y notificaciones.',
        icon: Icons.calendar_month_rounded,
        color: const Color(0xFFFF6B6B),
        technologies: ['Flutter Web', 'Supabase', 'Twilio'],
      ),
      ProjectItem(
        title: 'Invitación Digital Interactiva',
        category: 'Web App',
        description: 'Invitación de boda/XV años con confirmación RSVP, galería de fotos y cuenta regresiva.',
        icon: Icons.celebration_rounded,
        color: const Color(0xFFFBBF24),
        technologies: ['Flutter', 'Animations', 'Firebase'],
        demoUrl: '/wedding-demo', // Demo disponible
      ),
      ProjectItem(
        title: 'Landing Page Corporativa',
        category: 'Sitio Web',
        description: 'Página web profesional con diseño moderno, SEO optimizado y formulario de contacto.',
        icon: Icons.language_rounded,
        color: const Color(0xFF10B981),
        technologies: ['Flutter Web', 'Responsive', 'SEO'],
      ),
      ProjectItem(
        title: 'Dashboard de Métricas',
        category: 'Panel Admin',
        description: 'Visualización de datos en tiempo real con gráficos interactivos y reportes exportables.',
        icon: Icons.analytics_rounded,
        color: const Color(0xFF3B82F6),
        technologies: ['Flutter', 'REST API', 'Charts'],
      ),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF0D1B2A),
      ),
      child: Column(
        children: [
          // Section header
          Text(
            'Proyectos de Ejemplo',
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Ideas de lo que podemos crear juntos',
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 60),
          // Projects grid
          _buildProjectsGrid(projects, isMobile, isTablet),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid(List<ProjectItem> projects, bool isMobile, bool isTablet) {
    if (isMobile) {
      return Column(
        children: projects.map((project) => Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: _buildProjectCard(project, isMobile: true),
        )).toList(),
      );
    }

    int crossAxisCount = isTablet ? 2 : 3;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: isTablet ? 1.2 : 1.3,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _buildProjectCard(projects[index]);
      },
    );
  }

  Widget _buildProjectCard(ProjectItem project, {bool isMobile = false}) {
    if (isMobile) {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF1B263B),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: project.color.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: project.color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    project.icon,
                    color: project.color,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.category,
                        style: TextStyle(
                          fontSize: 12,
                          color: project.color,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        project.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              project.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.7),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.technologies.map((tech) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: project.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: project.color.withOpacity(0.3),
                  ),
                ),
                child: Text(
                  tech,
                  style: TextStyle(
                    fontSize: 12,
                    color: project.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )).toList(),
            ),
            if (project.demoUrl != null) ...[
              const SizedBox(height: 16),
              _buildDemoButton(project),
            ],
          ],
        ),
      );
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: const Color(0xFF1B263B),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: project.color.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: project.color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    project.icon,
                    color: project.color,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    project.category.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      color: project.color,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              project.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                project.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.7),
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.technologies.map((tech) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: project.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: project.color.withOpacity(0.3),
                  ),
                ),
                child: Text(
                  tech,
                  style: TextStyle(
                    fontSize: 12,
                    color: project.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )).toList(),
            ),
            if (project.demoUrl != null) ...[
              const SizedBox(height: 16),
              _buildDemoButton(project),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDemoButton(ProjectItem project) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Por ahora abre la demo de boda en una nueva pestaña
          // Cuando se despliegue, se puede cambiar la URL
          html.window.open(
            'https://sanfernandodev.github.io/wedding_invitation/',
            '_blank',
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: project.color,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: project.color.withOpacity(0.4),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.play_circle_outline,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: 8),
              const Text(
                'Ver Demo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
