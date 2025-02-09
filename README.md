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