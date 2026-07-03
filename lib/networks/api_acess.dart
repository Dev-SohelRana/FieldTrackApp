import 'package:field_track_app/features/auth/data/rx_post_register/rx.dart';
import 'package:field_track_app/features/auth/data/rx_post_sign_in/rx.dart';
import 'package:field_track_app/features/auth/model/login_response_model.dart';
import 'package:rxdart/subjects.dart';

RegisterRx registerRxOBJ = RegisterRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);

LoginRX loginRXObj = LoginRX(
  empty: LoginResponseModel(),
  dataFetcher: BehaviorSubject<LoginResponseModel>(),
);
