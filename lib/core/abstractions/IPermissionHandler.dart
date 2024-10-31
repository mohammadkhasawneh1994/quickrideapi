abstract class IPermissionHandler<IN> {
  IN value;
  IPermissionHandler(this.value);
  Future<bool> handlePermission();
}
