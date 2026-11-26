import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String backdropUrl;
  final String rating;
  final String releaseDate;
  final String runtime;
  final String genres;
  final String overview;
  final String budget;
  final List> cast;
  

  const DetailsPage({
    super.key,
    this.title = 'The Odyssey',
    this.backdropUrl = '',
    this.rating = '8.0',
    this.releaseDate = '2026-07-15',
    this.runtime = '173m',
    this.genres = 'Adventure | Action | Fantasy',
    this.overview =
        'Odysseus, the legendary King of Ithaca, embarks on a long and perilous journey home following the Trojan War. Throughout his voyage, he is forced to confront the whims of gods, mythological monsters, and trials that stretch b...',
    this.budget = '\$250.0M',
    this.cast = const [
      {'name': 'Matt Damon', 'image': ''},
      {'name': 'Tom Holland', 'image': ''},
      {'name': 'Anne Hathaway', 'image': ''},
      {'name': 'Robert Pattinson', 'image': ''},
      {'name': 'Himesh Patel', 'image': ''},
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة الخلفية العلوية مع تدرج لوني وزر الرجوع الظاهري
            Stack(
              children: [
                SizedBox(
                  height: 360,
                  width: double.infinity,
                  child: backdropUrl.isNotEmpty
                      ? Image.network(
                          backdropUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _backdropPlaceholder(),
                        )
                      : _backdropPlaceholder(),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.25),
                          Colors.transparent,
                          Colors.black,
                        ],
                        stops: const [0.0, 0.55, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 44,
                  left: 14,
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.35),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // العنوان + التقييم + أيقونة المفضلة
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFFC107),
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                        size: 24,
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // التاريخ والمدة
                  Text(
                    '$releaseDate • $runtime',
                    style: const TextStyle(
                      color: Color(0xFF9E9E9E),
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // أزرار Watch trailer و Watch Now
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFF141414),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF2C2C2C),
                              width: 1,
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Color(0xFFFF2A55),
                                size: 18,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Watch trailer',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF2A55),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Watch Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // التصنيفات
                  Text(
                    genres,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // القصة / الوصف
                  Text(
                    overview,
                    style: const TextStyle(
                      color: Color(0xFFBDBDBD),
                      fontSize: 14,
                      height: 1.45,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Show More',
                    style: TextStyle(
                      color: Color(0xFFFF2A55),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // الميزانية
                  const Text(
                    'Budget:',
                    style: TextStyle(
                      color: Color(0xFF9E9E9E),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    budget,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 22),

                  // قسم الممثلين Cast
                  const Text(
                    'Cast',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 112,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: cast.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final member = cast[index];
                        final memberName = member['name'] ?? '';
                        final memberImage = member['image'] ?? '';

                        return SizedBox(
                          width: 78,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  width: 78,
                                  height: 86,
                                  child: memberImage.isNotEmpty
                                      ? Image.network(
                                          memberImage,
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, __, ___) =>
                                              _castPlaceholder(),
                                        )
                                      : _castPlaceholder(),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                memberName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xFFE0E0E0),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backdropPlaceholder() {
    return Container(
      color: const Color(0xFF1A1A1A),
      alignment: Alignment.center,
      child: const Icon(
        Icons.movie_outlined,
        color: Color(0xFF555555),
        size: 56,
      ),
    );
  }

  Widget _castPlaceholder() {
    return Container(
      color: const Color(0xFF1F1F1F),
      alignment: Alignment.center,
      child: const Icon(
        Icons.person,
        color: Color(0xFF666666),
        size: 32,
      ),
    );
  }
}

