import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink rickAndMortyHttpLink = HttpLink(
  'https://api.spacex.land/graphql/',
);
ValueNotifier<GraphQLClient> grapqlClient = ValueNotifier(
  GraphQLClient(
    link: rickAndMortyHttpLink,
    cache: GraphQLCache(
      store: InMemoryStore(),
    ),
  ),
);
final String getUserQuery = """
{
  users {
    name
    rocket
  }
}
""";

const String getUserByName = r"""
query ($name: String!, $rocket: String!) {
  users(where: {name: {_eq: $name}, rocket: {_eq: $rocket}}) {
    name
    rocket
    id
  }
}
""";

const String deleteUserByName = r"""
mutation user($name: String!, $rocket: String!) {
  insert_users(objects: {name: $name, rocket: $rocket}) {
    returning {
      id
      name
      rocket
      timestamp
      twitter
    }
  }
}
""";
