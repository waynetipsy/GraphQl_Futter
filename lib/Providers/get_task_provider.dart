import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_provider/Schemas/urlendpoint.dart';
import '../Schemas/get_task_schema.dart';


class GetTaskProvider extends ChangeNotifier {
  bool _status = false;

  String _response = '';

  dynamic _list = [];

  bool get getStatus => _status;

  String get getResponse => _response;

 final EndPoint _point = EndPoint();

  void getTask(bool isLocal) async {
ValueNotifier<GraphQLClient> _client = _point.getClient();

QueryResult result = await _client.value.query(QueryOptions(
    document: gql(GetTaskSchema.getTaskJson),
   fetchPolicy: isLocal == true ? null : FetchPolicy.networkOnly, 
    ));

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
      print(result.data);
      _status = false;
      _list = result.data;
    notifyListeners();
    }
  }

  dynamic getResponseData() {
    if(_list.isNotEmpty) {
      final data = _list;

      return data['getTodos']  ?? {};
    } else {
      return {};
    }
  }

  void clear() {
    _response = '';
    notifyListeners();
  }

}