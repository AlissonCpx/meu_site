import 'package:meu_site/service/service_api.dart';
import 'package:rxdart/rxdart.dart';

class GetRep {
  final ServiceApi _service = ServiceApi();
  final _controller = BehaviorSubject();

  Stream get out => _controller.stream;

  Sink get input => _controller.sink;

  getReps() async {
    await _service.getReq().then(input.add);
  }

  void dispose() {
    _controller.close();
  }
}
