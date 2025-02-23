/*
🟢 Step 1: What is GetIt Doing?
Think of GetIt as a global storage where we register objects (dependencies) and
retrieve them whenever needed.
*/

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class AritcleImpApi {
  final Dio dio;
  AritcleImpApi({required this.dio});
}

void main() {
  final dio = Dio();
  final articleApi = AritcleImpApi(dio: dio);
}

// By getIt
/*
🟢 Step 2: Registering Dependencies in GetIt
Instead of manually creating instances everywhere, we register them once in GetIt.
*/

// create an instance of GetIt (This is the "global" storage)
final getItInstance = GetIt.instance;
// register dependencies (once during app startup)

void initDependencies() {
  getItInstance.registerSingleton<Dio>(Dio());
}


/*
🔵 What is registerSingleton<T>(Object) in GetIt?
The method registerSingleton<T>(Object) creates and stores a single instance of the given object
for the entire app.

getItInstance.registerSingleton<Dio>(Dio());

 - Creates an instance of Dio.
 - Stores it in GetIt.
 - Returns the same instance every time it's requested

 So, whenever you call:
 final dio = getItInstance<Dio>();

 🎯 Key Takeaways
✅ registerSingleton<T>(Object) stores a single instance and reuses it everywhere.
✅ Call it once at app startup (inside initDependencies()).
✅ Use getItInstance<T>() to retrieve dependencies anywhere.
✅ Don't call registerSingleton multiple times, or it will throw an error.



/// Register Dependencies
getItInstance.registerSingleton<Dio>(Dio());
getItInstance.registerSingleton<ArticleImpApi>(ArticleImpApi(dio: getItInstance<Dio>()));

/// Retrieve Dependencies
final api = getItInstance<ArticleImpApi>(); // Correctly gets ArticleImpApi
final dio = getItInstance<Dio>(); // Correctly gets Dio



🔵 How Does getItInstance() Know to Return Only Dio?
When you call:

ArticleImpApi(dio: getItInstance()),
GetIt automatically returns the correct instance based on the type expected.

🔵 How Does This Work?
Dart's type inference helps getItInstance() determine which dependency to return.

Since ArticleImpApi is expecting a Dio instance in its constructor:


class ArticleImpApi {
  final Dio dio;

  ArticleImpApi({required this.dio}); // Requires a Dio instance
}
And we registered Dio earlier:

getItInstance.registerSingleton<Dio>(Dio()); // Registered as Dio
When we call getItInstance(), Dart automatically understands that it should return Dio, because that’s what the constructor expects.

🔵 What If I Want a Different Dependency Instead of Dio?
If ArticleImpApi needed another dependency (e.g., AnotherService), you must specify it in the constructor:


class ArticleImpApi {
  final AnotherService service; // Now needs AnotherService

  ArticleImpApi({required this.service});
}
Then register and inject it correctly:


getItInstance.registerSingleton<AnotherService>(AnotherService());
getItInstance.registerSingleton<ArticleImpApi>(
    ArticleImpApi(service: getItInstance<AnotherService>())); // Get AnotherService
Now, getItInstance<ArticleImpApi>() will return an ArticleImpApi that uses AnotherService instead of Dio.
*/


