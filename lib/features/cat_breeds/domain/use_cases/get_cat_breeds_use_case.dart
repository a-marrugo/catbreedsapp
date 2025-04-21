import 'package:catbreedsapp/core/domain/entities/base_data.dart';
import 'package:catbreedsapp/core/domain/use_cases/base_use_case.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/entities/cat_breed.dart';
import 'package:catbreedsapp/features/cat_breeds/domain/repositories/cat_breed_repository.dart';
import 'package:injectable/injectable.dart';

/// This use case is responsible for retrieving a list of cat
/// breeds from the repository.
@injectable
class GetUserUseCase
    extends BaseUseCase<BaseData<List<CatBreed>>, ParamsGetUserUseCase> {
  /// Constructor
  GetUserUseCase(this._catBreedRepository);
  final CatBreedRepository _catBreedRepository;

  @override
  Future<BaseData<List<CatBreed>>> execute(ParamsGetUserUseCase params) =>
      _catBreedRepository.getCatBreeds(page: params.page, limit: params.limit);
}

/// Class params for [GetUserUseCase]
class ParamsGetUserUseCase {
  /// constructor
  ParamsGetUserUseCase({required this.page, required this.limit});

  /// The first value (`int`) is the page number to fetch.
  final int page;

  /// The second value (`int`) is the limit, which specifies
  /// the number of items per page.
  final int limit;
}
