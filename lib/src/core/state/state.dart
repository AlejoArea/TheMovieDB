enum DataEvents {
  loading,
  error,
  empty,
  success,
}

class DataState<T> {
  DataState({
    this.data,
    required this.state,
    this.error,
  });

  final T? data;
  final DataEvents state;
  final String? error;

  bool get isLoading => this.state == DataEvents.loading;

  bool get isEmpty => this.state == DataEvents.empty;

  bool get hasData => this.state == DataEvents.success;

  bool get hasError => this.state == DataEvents.error;

  @override
  bool operator ==(Object other) {
    return other is DataState && other.state == this.state;
  }

  @override
  int get hashCode => data.hashCode ^ state.hashCode;
}
