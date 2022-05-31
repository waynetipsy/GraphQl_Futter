import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:graphql_provider/Schemas/urlendpoint.dart';
import '../Schemas/delete_task_schema.dart';


class DeleteTaskProvider extends ChangeNotifier {
  bool _status = false;

  String _response = '';

  bool get getStatus => _status;

  String get getResponse => _response;

 final EndPoint _point = EndPoint();

  void deleteTask({int? todoId }) async {

    _status = true;
    _response = 'Please wait...';
    notifyListeners();

ValueNotifier<GraphQLClient> _client = _point.getClient();

QueryResult result = await _client.value.mutate(
  MutationOptions(
    document: gql(DeleteTask.deleteJson),
    variables: {
      'todoId': todoId,
    }));

    if(result.hasException) {
  print(result.exception);
  _status = false;
  if(result.exception!.graphqlErrors.isEmpty) {
    _response = 'Internet is not found';
  } else {
    _response = result.exception!.graphqlErrors[0].message.toString();
  }
    notifyListeners();
    }else {
      _status = false;
      _response = 'Task was sucessfully Deleted';
    notifyListeners();
    }
  }

  void clear() {
    _response = '';
    notifyListeners();
  }

}