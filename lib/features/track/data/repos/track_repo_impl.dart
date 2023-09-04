import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kargomkolay_tracking_app/core/error/error_model.dart';
import 'package:kargomkolay_tracking_app/core/error/failure.dart';
import 'package:kargomkolay_tracking_app/core/services/check_internet_connection.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_urls.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/track_model.dart';
import 'package:kargomkolay_tracking_app/features/track/data/repos/track_repo.dart';
import 'package:http/http.dart' as http;

class TrackRepoImplementaion implements TrackRepo {
  final CheckInternetConnection checkInternetConnection;

  const TrackRepoImplementaion(this.checkInternetConnection);

  @override
  Future<Either<Failure, TrackModel>> fetchTrackInfo(
      String carrierCompany, String trackingNumber, String language) async {
    try {
      // checking for internet connection
      final hasConnection =
          await checkInternetConnection.checkInternetConnection();
      if (hasConnection == false) {
        throw const SocketException('No Internet Connection');
      }

      // sending the request
      final response = await http.post(Uri.parse('${AppUrls.baseUrl}track'),
          body: jsonEncode({
            'carrierCompany': carrierCompany,
            'trackingNumber': trackingNumber,
          }),
          headers: {
            'content-type': 'application/json',
            'Accept-Language': language
          }).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException('Request Timeout');
      });

      final decodedResponse = jsonDecode(response.body);

      if (response.statusCode != 200) {
        final errorModel = ErrorModel.fromJson(decodedResponse);
        throw HttpException(errorModel.message);
      }

      final trackModel = TrackModel.fromJson(decodedResponse);
      return right(trackModel);
    } on HttpException catch (e) {
      return left(ServerFailure(e.message));
    } on SocketException catch (e) {
      return left(NoInternetConnectionFailure(e.message));
    } on TimeoutException catch (e) {
      return left(TimeoutFailure(
          '${e.message}: request Exceeded the defined duration'));
    } catch (error) {
      print(error);
      return left(const InternalAppFailure(
          'Something Went Wrong we are sorry! try again later'));
    }
  }
}
