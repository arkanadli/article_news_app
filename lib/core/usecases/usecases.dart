abstract class UseCase<Type, Params> {
  // create a bigger scope of usecase, that will call the functional programm into some boilerplate
  Future<Type> call({Params params});
}
