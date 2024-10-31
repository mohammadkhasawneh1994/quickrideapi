abstract class ILocationService<RET> {
  Future<RET> main();
}

abstract class WithValue<IN, RET> {
  Future<RET> main(IN value);
}
