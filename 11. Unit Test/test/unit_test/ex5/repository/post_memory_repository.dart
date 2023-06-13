import 'dart:math';

import 'package:day1/unit_test/ex5/model/post.dart';
import 'package:day1/unit_test/ex5/repository/post_memory_repository.dart';
import 'package:day1/unit_test/ex5/repository/post_repository.dart';
import 'package:test/test.dart';

void main() {
  test('PostMemoryRepository 테스트', () async {
    // 준비
    final PostRepository repository = PostMemoryRepository();

    final posts = await repository.getPosts();
    expect(posts.length, 0);

    final post = Post(0, 'test1', 'tests1');
    await repository.addPost(post);
    expect(posts.length, 1);

    await repository.updatePost(Post(0, 'test2', 'test2'));
    final firstPost = (await repository.getPosts())[0];
    expect(firstPost.title, 'test2');

    repository.deletePost(post);

    /// posts.remove(Post(0, 'test1', 'tests1') 동등성이 없기때문에 실패 hashcode 다르다.
    expect(posts.length, 1);
  });
}
