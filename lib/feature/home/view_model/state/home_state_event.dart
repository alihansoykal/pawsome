import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawsome/feature/home/view_model/state/home_state.dart';

class TextFieldChanged {
  final String text;

  TextFieldChanged(this.text);
}

class TextBloc extends Bloc<TextFieldChanged, TextWidgetState> {
  TextBloc() : super(TextWidgetState(text: 'Search')) {
    on<TextFieldChanged>((event, emit) {
      emit(TextWidgetState(text: event.text));
    });
  }
}
