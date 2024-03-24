import 'package:flutter_application_1/cubit/checklist/checklist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/checklist_repo.dart';
import '../../utils/get_it.dart';

class ChecklistCubit extends Cubit<ChecklistState> {
  final ChecklistRepo _checklistRepo = getIt.get<ChecklistRepo>();
  ChecklistCubit() : super(ChecklistState());

  Future<void> getChecklist({String? title, String? assigneeId, int? pageSize, int? pageNumber}) async {
    emit(ChecklistLoadingState());
    try {
      var checkLists = await _checklistRepo.getChecklist(title: title, assigneeId: assigneeId, pageSize: pageSize, pageNumber: pageNumber);
      emit(ChecklistSuccessState(checkLists));
    } catch (e) {
      emit(ChecklistFailedState(e.toString()));
    }
  }

  Future<void> updateChecklistStatus(String id, bool status) async {
    // emit(UpdateChecklistLoadingState());
    try {
      await _checklistRepo.updateChecklistStatus(id, status);
      // emit(UpdateChecklistSuccessState(checkList));
      getChecklist();
    } catch (e) {
      emit(UpdateChecklistFailedState(e.toString()));
    }
  }
}
