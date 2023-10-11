abstract class IMapper<FROM, TO> {
  TO call(FROM object);
}
