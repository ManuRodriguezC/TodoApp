import 'package:rxdart/rxdart.dart';
import 'package:halldenapp/bloc/resources/repository.dart';
import 'package:halldenapp/models/classes/user.dart';

class UserBloc {
  final _repository = Repository();
  final _userGetter = PublishSubject<User>();

  Observable<User> get getUser => _userGetter.stream;

  registerUser(String username, String firstname, String lastname,
      String password, String emailadress) async {
    User user = await _repository.registerUser(
        username, firstname, lastname, password, emailadress);
  }

  dispose() {
    _userGetter.close();
  }
}

final bloc = UserBloc();
