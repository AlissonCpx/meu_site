import 'package:meu_site/service/service_api.dart';
import 'package:rxdart/rxdart.dart';

class GetUser {
  final ServiceApi _service = ServiceApi();
  final _controller = BehaviorSubject();

  Stream get out => _controller.stream;

  Sink get input => _controller.sink;

  getUser() async {
    await _service.getUser().then(input.add);
  }

  void dispose() {
    _controller.close();
  }
}
