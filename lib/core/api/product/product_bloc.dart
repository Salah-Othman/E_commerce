import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:runway/model/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Dio dio;
  ProductBloc(this.dio) : super(ProductInitial()) {
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);

    on<FetchProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final response = await dio.get('https://fakestoreapi.com/products');
        if (response.statusCode == 200) {
          final productResponse = ProductResponse.fromJson(response.data);
          emit(ProductLoaded(productResponse: productResponse));
        } else {
          emit(
            ProductError(
              message: 'Failed to load data: ${response.statusCode}',
            ),
          );
        }
      } on DioException catch (e) {
        String errorMessage = 'Connection error';
        if (e.type == DioExceptionType.connectionTimeout) {
          errorMessage = 'Connection timeout - Check your internet';
        } else if (e.type == DioExceptionType.receiveTimeout) {
          errorMessage = 'Server timeout - Please try again';
        } else if (e.type == DioExceptionType.unknown) {
          errorMessage = 'Network error - Check internet connection';
        }
        emit(ProductError(message: errorMessage));
      } catch (e) {
        emit(ProductError(message: 'Error: $e'));
      }
    });
  }
}
