/// {@template api_repository}
/// A fake API repository
/// {@endtemplate}
class ApiRepository {
  /// {@macro api_repository}
  const ApiRepository();

  /// fetch todos
  List<String> fetchTodos() => ['make homework', 'go to shop', 'cook dinner'];
}
