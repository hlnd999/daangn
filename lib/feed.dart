import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl; // 이미지를 담을 변수

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  // 좋아요 여부
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CilpRRect 를 통해 이미지에 곡선 border 생성
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          // 이미지
          child: Image.network(
            widget.imageUrl, // 10번째 줄의 imageUrl 가져오기
            // 해당 위젯 내에 imageUrl 이 없어서 그대로 쓸수 없고
            // widget. 을 앞에 붙여주면 다른 위젯의 변수를 쓸수 있음
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'M1 아이패드 프로 11형(3세대) 와이파이 128G 팝니다.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                softWrap: false,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2),
              Text(
                '봉천동 · 6분 전',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '100만원',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      // 화면 갱신
                      setState(() {
                        isFavorite = !isFavorite; // 좋아요 토글
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          isFavorite
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: isFavorite ? Colors.pink : Colors.black,
                          size: 16,
                        ),
                        Text(
                          '1',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
