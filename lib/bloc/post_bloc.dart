import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_video/model/post.dart';
import 'package:image_video/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

// Bloc
class PostBloc extends Bloc<PostEvent, PostState> {
  final IPostRepository repository;

  PostBloc({required this.repository}) : super(PostInitial()) {
    on<LoadPosts>(_onLoadPosts);
  }

  Future<void> _onLoadPosts(LoadPosts event, Emitter<PostState> emit) async {
    try {
      emit(PostLoading());
      final posts = await repository.getPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
