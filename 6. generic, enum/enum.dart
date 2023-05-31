class StrongBox<E extends StrongBoxKey> {
  E? _key;
  int tryCnt = 0;

  E? get key => _key;
  StrongBox(E? key) : _key = key;

  void put(E key) {
    _key = key;
    tryCnt = 0;
  }

  String? get(int cnt) {
    tryCnt += 1;
    return cnt > tryCnt ? null : '열렸다.';
  }
}

enum StrongBoxKey { padlock, button, dial, finger }

extension StrongBoxKeyExtension on StrongBoxKey {
  int get cnt {
    switch (this) {
      case StrongBoxKey.padlock:
        return 1024;
      case StrongBoxKey.button:
        return 10000;
      case StrongBoxKey.dial:
        return 30000;
      case StrongBoxKey.finger:
        return 1000000;
    }
  }
}

void main() {
  StrongBox box = StrongBox(StrongBoxKey.padlock);

  // enum 4가지 열쇠 외에는 변경 불가
  //box.put('another key');

  for (int i = 0; i < StrongBoxKey.padlock.cnt; i++) {
    print(box.get(StrongBoxKey.padlock.cnt));
  }

  // 열쇠 종류를 put으로 바꾸면 열쇠와 남은 횟수 초기화
  box.put(StrongBoxKey.button);
  print('열쇠: ${box.key}, 남은 횟수: ${box.tryCnt}');
}
