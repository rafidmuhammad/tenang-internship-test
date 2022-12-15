part of 'doctor_cubit.dart';

abstract class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object> get props => [];
}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorSuccess extends DoctorState {
  final List<Doctor> doctors;

  const DoctorSuccess(this.doctors);

  @override
  List<Object> get props => [doctors];
}

class DoctorFailed extends DoctorState {
  final String error;

  const DoctorFailed(this.error);

  @override
  List<Object> get props => [error];
}
