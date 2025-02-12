# clean_architecture

A new Flutter project.

## Getting Started

Clean architecture start with this 3 folder
 1. features
 2. core
 3. shared

 # In features folder
   contain full app all features, like
   - auth
   - profile
   - cart
   - favourite
   - more
   - home/dashboard

   Each features  built with 3 layers
    1. data
    2. domain
    3. presentation


  # Core folder
    - utils
        - constant
        - log
        - usecases
        - validators
    - routes
    - network
    - servies
    - styles
    - helper
    - translations
    - others

 # Injections
   injection file containe all injection methods feature, and it is called from the main.dart.

 # Shared folder
   - like features folder but for app common features
   - payment features
   - shared pages
   - shared widgets
   - others

   # Api Calling

   1. We will start working on Domain Layer — Models, create a model for article Json coming from Api, this is the response of our Api:

   -  lib/features/article/domain/model
       - make a api response model which is come from server,same data model

   2. Now we will work on Data Layer — Data Source, after creating a model's files, we will create an Api for fetching articles data.

   - lib/features/article/data/data_sources/remote/abstract_article_api.dart
   
   * We implement the abstract class to incorporate the logic for retrieving data from the API.

   - lib/features/article/data/data_sources/remote/article_imp_api.dart

  3.  After creating a models and data source from Data layer, now we have to start creating a repositories interface and its implementation to achieve the core functionality that is crucial to the application’s domain.

  The repository establishes a connection with the data layer through a data source function, responsible for retrieving data and handling internal logic. for this reason, the repository takes an articlesApi instance in its constructor and used it to call articles Api.

  # Repositories
   * Domain Layer
     Now in Domain Layer — Repositories
     - inside domain/repositories folder, create a dart file abstract_articles_repository.dart:
   * Data Layer
     Now in Data Layer — Repositories
     - Next, proceed to the data/repositories directory to implement the above-mentioned abstract class.





  ### Main Logic is short
  
  Domain Layer
   - create a model exect api response model which is come from server,same data model

  Data Layer
   - in data source folder 
   - create a api for fetching articles data And handle error here

  Repositories folder
   - make a connection with data layer through a data source function
     - make a functin and fetch data by data layer remote data source function



