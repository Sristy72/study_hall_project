import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/core/common/constants/back_button.dart';

class StudentSearchScreen extends StatelessWidget {
  const StudentSearchScreen({super.key});

  static const _recentSearches = [
    'Business',
    'development',
    'technology',
    'UI/UX Designer',
  ];

  static const _popularTutors = [
    _TutorInfo(name: 'Alex Johnson', subject: 'French', likes: '500', rating: '4.5'),
    _TutorInfo(name: 'Floyd Miles', subject: 'Art', likes: '199', rating: '5.0'),
    _TutorInfo(name: 'Theresa Webb', subject: 'English', likes: '100', rating: '4.5'),
    _TutorInfo(name: 'Robert Fox', subject: 'French', likes: '500', rating: '4.5'),
    _TutorInfo(name: 'Kathryn Murphy', subject: 'Art', likes: '199', rating: '5.0'),
    _TutorInfo(name: 'Ronald Richards', subject: 'English', likes: '100', rating: '4.5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SearchHeader(title: 'Search'),
                  const SizedBox(height: 20),
                  _SearchBarRow(
                    hintText: 'Search',
                    showPrefixIcon: true,
                    readOnly: true,
                    onTap: () => Get.to(() => const SearchSuggestionScreen()),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Recent Search',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _recentSearches
                        .map((label) => _RecentChip(label: label))
                        .toList(),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Search by Popular Tutor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.95,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: _popularTutors.length,
                    itemBuilder: (context, index) {
                      final tutor = _popularTutors[index];
                      return _PopularTutorCard(info: tutor);
                    },
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Search by Popular Courses',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const _PopularCourseCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchSuggestionScreen extends StatefulWidget {
  const SearchSuggestionScreen({super.key});

  @override
  State<SearchSuggestionScreen> createState() => _SearchSuggestionScreenState();
}

class _SearchSuggestionScreenState extends State<SearchSuggestionScreen> {
  static const _suggestions = [
    'Introduction to Graphic Cover',
    'Cover letter for Beginners',
    'Cover letter Principles',
  ];

  late final TextEditingController _controller;
  String _query = 'Cover';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _query);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openResults([String? query]) {
    final effectiveQuery = query ?? _query;
    if (effectiveQuery.trim().isEmpty) {
      return;
    }
    Get.to(() => SearchResultsScreen(query: effectiveQuery));
  }

  @override
  Widget build(BuildContext context) {
    final filteredSuggestions = _suggestions.where((item) {
      if (_query.trim().isEmpty) {
        return true;
      }
      return item.toLowerCase().contains(_query.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SearchHeader(title: 'Search'),
                  const SizedBox(height: 20),
                  _SearchBarRow(
                    controller: _controller,
                    hintText: 'Search',
                    readOnly: false,
                    showClear: _query.isNotEmpty,
                    onClear: () {
                      _controller.clear();
                      setState(() {
                        _query = '';
                      });
                    },
                    onChanged: (value) => setState(() => _query = value),
                    onSubmitted: _openResults,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Suggestions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredSuggestions.length,
                    separatorBuilder: (_, __) => const Divider(height: 24),
                    itemBuilder: (context, index) {
                      final suggestion = filteredSuggestions[index];
                      return _SuggestionTile(
                        suggestion: suggestion,
                        query: _query,
                        onTap: () => _openResults(suggestion),
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

class SearchResultsScreen extends StatefulWidget {
  final String query;

  const SearchResultsScreen({super.key, required this.query});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  late final TextEditingController _controller;
  late String _query;

  final List<_SearchResultInfo> _results = const [
    _SearchResultInfo(
      status: 'Ongoing',
      title: 'How to write Cover Letter',
      teacher: 'Emily john',
      category: 'Business',
      code: 'S00001',
      isOnline: true,
      locationOrMode: 'Online',
      schedule: 'Tuesday, Thursday 10:00am - 11:00am',
    ),
    _SearchResultInfo(
      status: 'Ongoing',
      title: 'How to write Cover Letter',
      teacher: 'Emily john',
      category: 'Business',
      code: 'S00001',
      isOnline: false,
      locationOrMode: 'Lucy Coffee - 14 Kiln Street',
      schedule: 'Thursday 10:00am - 11:00am',
    ),
    _SearchResultInfo(
      status: 'Ongoing',
      title: 'How to write Cover Letter',
      teacher: 'Emily john',
      category: 'Business',
      code: 'S00001',
      isOnline: true,
      locationOrMode: 'Online',
      schedule: 'Tuesday, Thursday 10:00am - 11:00am',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _query = widget.query;
    _controller = TextEditingController(text: _query);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayQuery = _query.isEmpty ? widget.query : _query;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SearchHeader(title: 'Search'),
                  const SizedBox(height: 20),
                  _SearchBarRow(
                    controller: _controller,
                    hintText: 'Search',
                    readOnly: false,
                    showClear: _query.isNotEmpty,
                    onClear: () {
                      _controller.clear();
                      setState(() {
                        _query = '';
                      });
                    },
                    onChanged: (value) => setState(() => _query = value),
                    onSubmitted: (value) => setState(() => _query = value),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '34 Result for "$displayQuery"',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 14),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _results.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final result = _results[index];
                      return _SearchResultCard(
                        info: result,
                        onMoreTap: () => showCautionDialog(context),
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

class _SearchHeader extends StatelessWidget {
  final String title;

  const _SearchHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomBackButton2(),
        const SizedBox(width: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111827),
          ),
        ),
      ],
    );
  }
}

class _SearchBarRow extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool readOnly;
  final bool showPrefixIcon;
  final bool showClear;
  final VoidCallback? onClear;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const _SearchBarRow({
    this.controller,
    required this.hintText,
    required this.readOnly,
    this.showPrefixIcon = false,
    this.showClear = false,
    this.onClear,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: showPrefixIcon
                  ? const Icon(Icons.search, color: Color(0xFF9CA3AF))
                  : null,
              suffixIcon: showClear
                  ? IconButton(
                      icon: const Icon(Icons.close, color: Color(0xFF9CA3AF)),
                      onPressed: onClear,
                    )
                  : null,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF93C5FD), width: 1.2),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const _FilterButton(),
      ],
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/filter.png',
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}

class _RecentChip extends StatelessWidget {
  final String label;

  const _RecentChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF111827),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.close, size: 16, color: Color(0xFF111827)),
        ],
      ),
    );
  }
}

class _TutorInfo {
  final String name;
  final String subject;
  final String likes;
  final String rating;

  const _TutorInfo({
    required this.name,
    required this.subject,
    required this.likes,
    required this.rating,
  });
}

class _PopularTutorCard extends StatelessWidget {
  final _TutorInfo info;

  const _PopularTutorCard({required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD1D5DB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/p2.png',
              width: 36,
              height: 36,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            info.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'I teach ${info.subject}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6B7280),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.favorite_border, size: 14, color: Color(0xFF9CA3AF)),
              const SizedBox(width: 4),
              Text(
                info.likes,
                style: const TextStyle(fontSize: 12),
              ),
              const Spacer(),
              const Icon(Icons.star, size: 14, color: Color(0xFFF59E0B)),
              const SizedBox(width: 4),
              Text(
                info.rating,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PopularCourseCard extends StatelessWidget {
  const _PopularCourseCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  'assets/images/business.png',
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Intermediate',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 6),
                      Image.asset('assets/images/range.png', width: 12, height: 12),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Vector.png', width: 12, height: 12),
                      const SizedBox(width: 4),
                      const Text('4.5', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                const Text(
                  'Business',
                  style: TextStyle(
                    color: Color(0xFF3B82F6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(Icons.favorite_border, color: Color(0xFF3B82F6)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestionTile extends StatelessWidget {
  final String suggestion;
  final String query;
  final VoidCallback onTap;

  const _SuggestionTile({
    required this.suggestion,
    required this.query,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = const TextStyle(
      fontSize: 16,
      color: Color(0xFF6B7280),
      fontWeight: FontWeight.w500,
    );
    final highlightStyle = baseStyle.copyWith(
      color: const Color(0xFF111827),
      fontWeight: FontWeight.w700,
    );

    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const Icon(Icons.search, color: Color(0xFF9CA3AF)),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: _highlightQuery(suggestion, query, baseStyle, highlightStyle),
            ),
          ),
        ],
      ),
    );
  }

  TextSpan _highlightQuery(
    String text,
    String query,
    TextStyle base,
    TextStyle highlight,
  ) {
    if (query.trim().isEmpty) {
      return TextSpan(text: text, style: base);
    }
    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();
    final startIndex = lowerText.indexOf(lowerQuery);
    if (startIndex == -1) {
      return TextSpan(text: text, style: base);
    }
    final endIndex = startIndex + query.length;
    return TextSpan(
      children: [
        TextSpan(text: text.substring(0, startIndex), style: base),
        TextSpan(text: text.substring(startIndex, endIndex), style: highlight),
        TextSpan(text: text.substring(endIndex), style: base),
      ],
    );
  }
}

class _SearchResultInfo {
  final String status;
  final String title;
  final String teacher;
  final String category;
  final String code;
  final bool isOnline;
  final String locationOrMode;
  final String schedule;

  const _SearchResultInfo({
    required this.status,
    required this.title,
    required this.teacher,
    required this.category,
    required this.code,
    required this.isOnline,
    required this.locationOrMode,
    required this.schedule,
  });
}

class _SearchResultCard extends StatelessWidget {
  final _SearchResultInfo info;
  final VoidCallback onMoreTap;

  const _SearchResultCard({
    required this.info,
    required this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  info.status,
                  style: const TextStyle(
                    color: Color(0xFF3B82F6),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: onMoreTap,
                child: const Icon(Icons.more_horiz, color: Color(0xFF9CA3AF)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            info.title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/p2.png',
                  width: 28,
                  height: 28,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${info.teacher}  •  ${info.category}  •  ${info.code}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF3B82F6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                info.isOnline ? Icons.videocam_outlined : Icons.place_outlined,
                size: 18,
                color: const Color(0xFF6B7280),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  info.locationOrMode,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: Color(0xFF6B7280),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  info.schedule,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showCautionDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => const _CautionDialog(),
  );
}

class _CautionDialog extends StatelessWidget {
  const _CautionDialog();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            constraints: const BoxConstraints(maxWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/Frame.png',
                  height: 220,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Caution !',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Changes you made may not be saved.\nDo you want to continue this action?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'No',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFDE2E8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Yes Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFEF476F),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.close_rounded,
                color: Color(0xFF07335B),
                size: 26,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
