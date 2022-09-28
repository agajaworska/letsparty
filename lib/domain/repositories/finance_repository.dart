import 'package:letsparty/data/remote_data_sources/finance_remote_data_source.dart';
import 'package:letsparty/domain/models/budget_model.dart';

class FinanceRepository {
  FinanceRepository(
    this.financeRemoteDataSource,
  );

  final FinanceRemoteDataSource financeRemoteDataSource;

  Stream<List<BudgetModel>> getBudgetStream() {
    return financeRemoteDataSource.getBudgetStream().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return BudgetModel(
              id: doc.id,
              data: doc['data'],
            );
          },
        ).toList();
      },
    );
  }

  Future<void> addBudgetDocuments({required String data}) {
    return financeRemoteDataSource.addBudgetDocuments(data: data);
  }

  Future<void> updateBudgetDocuments(
      {required String id, required String data}) {
    return financeRemoteDataSource.updateBudgetDocuments(id: id, data: data);
  }

  Future<void> removeBudgetDocuments({required String id}) {
    return financeRemoteDataSource.removeBudgetDocuments(id: id);
  }
}
