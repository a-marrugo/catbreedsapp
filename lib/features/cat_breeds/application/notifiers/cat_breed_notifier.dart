import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/use_cases/get_cat_breeds_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A Riverpod `AsyncNotifier` responsible for managing
/// the state of cat breeds data.
/// It handles fetching, pagination, and refreshing the list of cat breeds.
class CatBreedsNotifier extends AsyncNotifier<List<CatBreed>> {
  /// Constructor
  ///
  /// Initializes the notifier with the required `GetUserUseCase`.
  CatBreedsNotifier(this._getUserUseCase);

  final GetUserUseCase _getUserUseCase;

  /// Indicates whether the current page is the last page.
  bool get isLastPage => _isLastPage;

  final int _limit = 10;
  int _page = 0;
  bool _isLastPage = false;
  bool _isLoadingMore = false;

  final List<CatBreed> _breeds = [];

  /// Fetches the initial list of cat breeds.
  ///
  /// - Calls the `GetUserUseCase` with the current `_page` and `_limit`.
  /// - Updates the `_breeds` list and checks if the last page is reached.
  /// - Returns the list of cat breeds.
  @override
  Future<List<CatBreed>> build() async {
    return _fetchInitial();
  }

  /// Fetches the initial page of cat breeds.
  ///
  /// - Calls the `GetUserUseCase` with `_page` and `_limit`.
  /// - Adds the fetched data to `_breeds`.
  /// - Sets `_isLastPage` to `true` if fewer items than `_limit` are returned.
  Future<List<CatBreed>> _fetchInitial() async {
    state = const AsyncLoading();
    final result = await _getUserUseCase.execute(
      ParamsGetUserUseCase(
        page: _page,
        limit: _limit,
      ),
    );

    final data = result.data;
    _breeds.addAll(data);
    if (data.length < _limit) _isLastPage = true;
    state = AsyncData(_breeds);
    return _breeds;
  }

  /// Loads more cat breeds for pagination.
  ///
  /// - Prevents loading if `_isLastPage` or `_isLoadingMore` is `true`.
  /// - Increments `_page` and fetches the next page of data.
  /// - Adds the fetched data to `_breeds` and updates the state.
  /// - Sets `_isLastPage` to `true` if fewer items than `_limit` are returned.
  Future<void> loadMore() async {
    if (_isLastPage || _isLoadingMore) return;
    _isLoadingMore = true;
    _page++;

    try {
      final result = await _getUserUseCase.execute(
        ParamsGetUserUseCase(
          page: _page,
          limit: _limit,
        ),
      );
      final moreBreeds = result.data;

      if (moreBreeds.isEmpty || moreBreeds.length < _limit) {
        _isLastPage = true; // Mark as the last page if no more data
      }

      _breeds.addAll(moreBreeds);
      state = AsyncData(_breeds);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    } finally {
      _isLoadingMore = false; // Ensure loading state is reset
    }
  }

  /// Searches cat breeds by a query string.
  ///
  /// Calls the use case with the query and updates the state with the results.
  Future<void> search(String query) async {
    state = const AsyncLoading();
    _page = 0;
    _isLastPage = false;
    _breeds.clear();

    try {
      final result = await _getUserUseCase.execute(
        ParamsGetUserUseCase(
          page: _page,
          limit: _limit,
          query: query.isEmpty ? null : query,
        ),
      );
      final data = result.data;
      _breeds.addAll(data);
      if (data.length < _limit) _isLastPage = true;
      state = AsyncData(_breeds);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
