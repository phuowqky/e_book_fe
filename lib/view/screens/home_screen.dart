import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0D1D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.grid_view_rounded),
        title: const Text('LiveScore'),
        centerTitle: true,
        actions: const [Icon(Icons.notifications_none_rounded)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF5C48E0), Color(0xFFD46EF4)],
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text('60 : 22', style: TextStyle(fontSize: 16, color: Colors.white70)),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/barca.png', width: 40),
                            const Text('2 - 2', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                            Image.asset('assets/mancity.png', width: 40),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('De Jong 66\'\nDepay 79\'', style: TextStyle(fontSize: 12)),
                            Text('Alvarez 21\'\nPalmer 70\'', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 70,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1C2F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/brighton.png', width: 30),
                      const SizedBox(height: 6),
                      const Text('Samuel 40\'', style: TextStyle(fontSize: 10))
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Match Schedule', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('See All', style: TextStyle(color: Colors.purpleAccent))
              ],
            ),
            const SizedBox(height: 12),
            MatchCard(team1: 'Chelsea', date: '27 Aug 2022', time: '01.40', team2: 'Leicester', asset1: 'barca.png', asset2: 'tottenham.png'),
            MatchCard(team1: 'Brighton', date: '27 Aug 2022', time: '00.10', team2: 'Leeds Unit', asset1: 'brighton.png', asset2: 'leeds.png'),
            MatchCard(team1: 'Man City', date: '29 Aug 2022', time: '19.40', team2: 'Crystal Pa', asset1: 'mancity.png', asset2: 'crystal.png'),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Football News', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('See All', style: TextStyle(color: Colors.purpleAccent))
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/news.png', width: 70, height: 70, fit: BoxFit.cover),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Champions League 2022-23 draw: group stage analysis and predictions',
                    style: TextStyle(fontSize: 13),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1D1C2F),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final String team1, team2, date, time, asset1, asset2;

  const MatchCard({
    super.key,
    required this.team1,
    required this.team2,
    required this.date,
    required this.time,
    required this.asset1,
    required this.asset2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1C2F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/$asset1', width: 26),
              const SizedBox(width: 8),
              Text(team1),
            ],
          ),
          Column(
            children: [
              Text(date, style: const TextStyle(fontSize: 10)),
              Text(time, style: const TextStyle(fontSize: 10)),
            ],
          ),
          Row(
            children: [
              Text(team2),
              const SizedBox(width: 8),
              Image.asset('assets/$asset2', width: 26),
            ],
          ),
        ],
      ),
    );
  }
}
