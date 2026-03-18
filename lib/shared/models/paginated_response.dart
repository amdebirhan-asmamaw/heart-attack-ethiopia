import 'package:equatable/equatable.dart';

class PaginatedResponse<T> extends Equatable {
  const PaginatedResponse({
    required this.items,
    required this.page,
    required this.totalPages,
    required this.totalItems,
  });

  final List<T> items;
  final int page;
  final int totalPages;
  final int totalItems;

  @override
  List<Object?> get props => [items, page, totalPages, totalItems];
}
