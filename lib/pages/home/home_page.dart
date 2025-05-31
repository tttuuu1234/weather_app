import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('天気予報'),
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
          ],
        ),
        backgroundColor: Colors.white.withValues(alpha: .3),
        elevation: 0,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .1),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withValues(alpha: .2),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF60A5FA), // 明るい青（空の色）
              Color(0xFF3B82F6), // 中間の青
              Color(0xFF2563EB), // 深い青（夕空の色）
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(
                          alpha: 0.2,
                        ), // bg-white/20
                        border: Border.all(
                          color: Colors.white.withValues(
                            alpha: 0.3,
                          ), // border-white/30
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        cursorColor: Colors.white.withValues(alpha: .3),
                        decoration: InputDecoration(
                          border: InputBorder.none, // 既存のボーダーを無効化
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          hintText: '都市名を検索...',
                          hintStyle: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.withValues(alpha: 0.4),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .15), // bg-white/15
                    borderRadius: BorderRadius.circular(16), // rounded-2xl
                    border: Border.all(
                      color: Colors.white.withValues(
                        alpha: 0.2,
                      ), // border-white/20
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('東京'),
                            Icon(Icons.favorite_outline),
                          ],
                        ),
                        Text('☀️'),
                        Text('24°'),
                        Text('晴れ'),
                        Text('体感温度 26°'),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _WeatherCondition(),
                            _WeatherCondition(),
                            _WeatherCondition(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WeatherCondition extends StatelessWidget {
  const _WeatherCondition();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(
          alpha: .15,
        ), // bg-white/15
        borderRadius: BorderRadius.circular(
          16,
        ), // rounded-2xl
        border: Border.all(
          color: Colors.transparent,
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          Icon(Icons.wind_power),
          Text('12km/h'),
          Text('風速'),
        ],
      ),
    );
  }
}
