import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Inline Header
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerLeft,
                          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF420C11), size: 24),
                          onPressed: () => context.pop(),
                        ),
                        // Distribute space to strictly center the title relative to the whole container
                        const Expanded(child: SizedBox()),
                        Text(
                          'Languages',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF000000),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        // Invisible placeholder to perfectly center the text
                        const SizedBox(width: 48), 
                      ],
                    ),
                    const SizedBox(height: 24),
                    ...[
                      {'label': 'Amharic', 'flag': '🇪🇹'},
                      {'label': 'English', 'flag': '🇬🇧'},
                      {'label': 'Arabic', 'flag': '🇸🇦'},
                      {'label': 'Portuguese', 'flag': '🇵🇹'},
                      {'label': 'French', 'flag': '🇫🇷'},
                      {'label': 'Spanish', 'flag': '🇪🇸'},
                    ].map((lang) => Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: _LanguageItem(
                            label: lang['label']!,
                            flagEmoji: lang['flag']!,
                            isSelected: _selectedLanguage == lang['label'],
                            onTap: () => setState(() => _selectedLanguage = lang['label']!),
                          ),
                        )),
                    const SizedBox(height: 8), // Padding below the last item (-16 from the last padding element added)
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                   width: 140, // Expanded slightly for 'Save Changes' comfortable fit
                   height: 40,
                   child: ElevatedButton(
                     onPressed: () {},
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0xFF420C11),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(18),
                       ),
                       elevation: 0,
                       padding: EdgeInsets.zero,
                     ),
                     child: Text(
                       'Save Changes',
                       style: GoogleFonts.inter(
                         fontSize: 12,
                         fontWeight: FontWeight.w500,
                         color: Colors.white,
                         height: 1.2,
                       ),
                     ),
                   ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageItem extends StatelessWidget {
  const _LanguageItem({
    required this.label,
    required this.flagEmoji,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String flagEmoji;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFEAE8E8).withValues(alpha: 0.25),
          borderRadius: BorderRadius.circular(18),
          border: isSelected 
              ? Border.all(color: const Color(0xFF420C11), width: 1.5) 
              : Border.all(color: Colors.transparent, width: 1.5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF333333),
              ),
            ),
            Text(
              flagEmoji,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
