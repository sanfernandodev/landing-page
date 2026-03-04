import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
        color: Color(0xFF0D1B2A),
      ),
      child: isMobile
          ? Column(
              children: [
                _buildContent(isMobile),
                const SizedBox(height: 60),
                _buildSkills(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildContent(isMobile)),
                const SizedBox(width: 80),
                Expanded(child: _buildSkills()),
              ],
            ),
    );
  }

  Widget _buildContent(bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProfilePhoto(isMobile),
          const SizedBox(height: 32),
          _buildTextContent(isMobile),
        ],
      );
    }
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProfilePhoto(isMobile),
        const SizedBox(width: 48),
        Expanded(child: _buildTextContent(isMobile)),
      ],
    );
  }

  Widget _buildProfilePhoto(bool isMobile) {
    return Container(
      width: isMobile ? 180 : 220,
      height: isMobile ? 180 : 220,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/profile.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFF1B263B),
              child: const Icon(
                Icons.person,
                size: 80,
                color: Color(0xFF4ECDC4),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const Text(
          'Sobre Mí',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4ECDC4),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Apasionado por la tecnología y el desarrollo',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 28 : 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Soy desarrollador de software con experiencia en creación de soluciones digitales. '
          'Me especializo en desarrollo web y móvil, siempre buscando entregar productos de alta calidad '
          'que superen las expectativas de mis clientes.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.7),
            height: 1.8,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Mi objetivo es ayudar a negocios y emprendedores a crecer en el mundo digital, '
          'ofreciendo servicios integrales desde el diseño hasta el soporte técnico.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.7),
            height: 1.8,
          ),
        ),
        const SizedBox(height: 32),
        // Location
        Row(
          mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on_rounded,
              color: const Color(0xFF4ECDC4),
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Honduras 🇭🇳',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSkills() {
    final skills = [
      SkillItem('Flutter & Dart', 0.9),
      SkillItem('HTML/CSS/JavaScript', 0.95),
      SkillItem('React & Next.js', 0.8),
      SkillItem('Diseño UI/UX', 0.85),
      SkillItem('Soporte Técnico', 0.95),
      SkillItem('Windows & Office', 0.9),
    ];

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF1B263B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF2D3A4F),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Habilidades',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 32),
          ...skills.map((skill) => _buildSkillBar(skill)).toList(),
        ],
      ),
    );
  }

  Widget _buildSkillBar(SkillItem skill) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                '${(skill.level * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xFF253449),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: skill.level,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4ECDC4), Color(0xFF6C63FF)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillItem {
  final String name;
  final double level;

  SkillItem(this.name, this.level);
}
