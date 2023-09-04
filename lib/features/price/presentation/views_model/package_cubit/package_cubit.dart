import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/package_model.dart';

class PackageCubit extends Cubit<List<PackageModel>> {
  PackageCubit() : super([const PackageModel(0.00, 0, 0, 0)]);

  void updatePackageAtIndexAt(int index, PackageModel updatedPackage) {
    final currentState = List<PackageModel>.from(state);
    currentState[index] = updatedPackage;
    emit(currentState);
  }

  void addPackage() {
    final currentState = List<PackageModel>.from(state);
    currentState.add(const PackageModel(0.00, 0, 0, 0));
    emit(currentState);
  }

  void removeLastPackage() {
    final currentState = List<PackageModel>.from(state);
    if (currentState.length > 1) {
      currentState.removeAt(currentState.length - 1);
      emit(currentState);
    }
  }

  void resetPackages() {
    final currentState = List<PackageModel>.from(state);
    currentState.clear();
    currentState.add(const PackageModel(0.00, 0, 0, 0));
    emit(currentState);
  }

  double getTotalWeight() {
    return state.fold(
        0, (previousValue, element) => element.weight + previousValue);
  }

  double calculateVolumetricWeight(PackageModel package) {
    const volumetricDivisor = 5000;

    return (package.height * package.length * package.width) /
        volumetricDivisor;
  }

  double getTotalVolumetricWeight() {
    final validPackages = state.where((package) =>
        package.height > 0 && package.length > 0 && package.width > 0);

    // checking if there is no package found
    if (validPackages.isEmpty) {
      return 0.0;
    }

    double totalVolumetricWeight = 0.0;
    for (final package in validPackages) {
      totalVolumetricWeight += calculateVolumetricWeight(package);
    }

    return double.parse(totalVolumetricWeight.toStringAsFixed(2));
    // return totalVolumetricWeight;
  }

  // checking if all fields are entered
  bool isValid() {
    for (PackageModel packageModel in state) {
      if (packageModel.height <= 0 ||
          packageModel.length <= 0 ||
          packageModel.weight <= 0 ||
          packageModel.width <= 0) {
        return false;
      }
    }

    return true;
  }
}
