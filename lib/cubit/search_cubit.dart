import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tenang_test/model/doctor_model.dart';
import 'package:tenang_test/services/doctor_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void dataSearch(String searchController) async {
    try {
      emit(SearchLoading());
      List<Doctor> doctors = await DoctorService().getDoctor();
      List<Doctor> results = doctors
          .where((element) => element.name
              .toLowerCase()
              .contains(searchController.toLowerCase()))
          .toList();

      emit(SearchSuccess(results));
    } catch (e) {
      emit(SearchFailed(e.toString()));
    }
  }
}
