import 'package:flutter/material.dart';
import '../../../../core/common/constants/back_button.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = 'English';

  final List<Map<String, String>> _languages = [
    {'name': 'English', 'flag': '🇬🇧'},
    {'name': 'Dutch', 'flag': '🇳🇱'},
    {'name': 'French', 'flag': '🇫🇷'},
    {'name': 'German', 'flag': '🇩🇪'},
    {'name': 'Afrikaans', 'flag': '🇿🇦'},
    {'name': 'Arabic', 'flag': '🇸🇦'},
    {'name': 'Bosnian', 'flag': '🇧🇦'},
    {'name': 'Chinese (Mandarin)', 'flag': '🇨🇳'},
    {'name': 'Hindi', 'flag': '🇮🇳'},
    {'name': 'Indonesian', 'flag': '🇮🇩'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: const [
                        CustomBackButton2(),
                        SizedBox(width: 16),
                        Text(
                          'Language',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Divider(
                    height: 1.5,
                    thickness: 1.5,
                    color: Color(0xFFE5E7EB),
                  ),

                  const SizedBox(height: 16),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: _languages.length,
                    itemBuilder: (context, index) {
                      final lang = _languages[index];
                      final isSelected =
                          lang['name'] == _selectedLanguage;

                      return Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 6),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            setState(() {
                              _selectedLanguage = lang['name']!;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.blue.withOpacity(0.08)
                                  : Colors.transparent,
                              borderRadius:
                              BorderRadius.circular(16),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.grey.shade300,
                                width: isSelected ? 1.5 : 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    lang['flag']!,
                                    style:
                                    const TextStyle(fontSize: 28),
                                  ),
                                ),

                                const SizedBox(width: 16),

                                Expanded(
                                  child: Text(
                                    lang['name']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                      color: isSelected
                                          ? Colors.blue.shade800
                                          : Colors.black87,
                                    ),
                                  ),
                                ),

                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.blue
                                          : Colors.grey.shade400,
                                      width: 2,
                                    ),
                                  ),
                                  child: isSelected
                                      ? const Center(
                                    child: CircleAvatar(
                                      radius: 6,
                                      backgroundColor:
                                      Colors.blue,
                                    ),
                                  )
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
