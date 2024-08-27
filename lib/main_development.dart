import 'package:api_repository/api_repository.dart';
import 'package:fuji_film_recipe/app/view/app.dart';
import 'package:fuji_film_recipe/bootstrap.dart';
import 'package:fuji_film_recipe/firebase_options.dart';
import 'package:shared/shared.dart';

void main() {
  const apiRepository = ApiRepository();
  bootstrap(() {return const App(apiRepository: apiRepository);},
      appFlavor: AppFlavor.development(),
      options: DefaultFirebaseOptions.currentPlatform);
}
