import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/api.dart';
import 'package:practice/datamodels/jsonmodel.dart';
import 'package:practice/datamodels/multimodel.dart';

final userprovider=Provider<User>((ref) { return User();});
final userrepository=FutureProvider.autoDispose<Model?>((ref) {
  final userrepo=ref.watch(userprovider);
  return userrepo.getModel();
}
);

final mmodelprovider=Provider<MultiUserModel>((ref) => MultiUserModel());
final mmodelrepository=FutureProvider.autoDispose<Multimodel?>((ref) {
  final mmodelrepo=ref.watch(mmodelprovider);
  return mmodelrepo.getMultiModel();
}
);
