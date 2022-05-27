import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_provider/Utilis/url.dart';

class EndPoint {
  
  ValueNotifier<GraphQLClient> getClient() {
    ValueNotifier<GraphQLClient>_client = ValueNotifier(
      GraphQLClient(
      link: HttpLink(endpointUrl),

      cache: GraphQLCache(store: HiveStore())
      )
     );
    return _client;

  }
}