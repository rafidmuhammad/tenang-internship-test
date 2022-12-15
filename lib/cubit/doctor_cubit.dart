import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tenang_test/model/doctor_model.dart';
import 'package:tenang_test/services/doctor_service.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  void fetchDoctors() async {
    try {
      emit(DoctorLoading());
      List<Doctor> doctors = await DoctorService().getDoctor();
      emit(DoctorSuccess(doctors));
    } catch (e) {
      emit(DoctorFailed(e.toString()));
    }
  }
}
