/// Contract to handle use cases in the app
///
/// `Entity` = Entity to get on data state
///
/// `Params` = Parameters to handle on UseCase (`UseCase`)
// ignore: one_member_abstracts
abstract class BaseUseCase<Entity, Params> {
  /// Execute the use case
  Future<Entity> execute(Params params);
}
