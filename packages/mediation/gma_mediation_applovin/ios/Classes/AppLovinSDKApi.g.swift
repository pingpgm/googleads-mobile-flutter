// Autogenerated from Pigeon (v22.7.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class PigeonError: Error {
  let code: String
  let message: String?
  let details: Any?

  init(code: String, message: String?, details: Any?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    return
      "PigeonError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
  }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? PigeonError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

private class AppLovinSDKApiPigeonCodecReader: FlutterStandardReader {
}

private class AppLovinSDKApiPigeonCodecWriter: FlutterStandardWriter {
}

private class AppLovinSDKApiPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return AppLovinSDKApiPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return AppLovinSDKApiPigeonCodecWriter(data: data)
  }
}

class AppLovinSDKApiPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = AppLovinSDKApiPigeonCodec(
    readerWriter: AppLovinSDKApiPigeonCodecReaderWriter())
}

/// The generated classes set the channels to call the methods in the corresponding kotlin AppLovinSDKApi interface and swift AppLovinSDKApi protocol from the dart layer.
///
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol AppLovinSDKApi {
  /// Used to configure GDPR consent on the Android or iOS AppLovin SDK
  func setHasUserConsent(hasUserConsent: Bool) throws
  /// Used to opt out of the sale of personal information in AppLovin SDK.
  func setDoNotSell(doNotSell: Bool) throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class AppLovinSDKApiSetup {
  static var codec: FlutterStandardMessageCodec { AppLovinSDKApiPigeonCodec.shared }
  /// Sets up an instance of `AppLovinSDKApi` to handle messages through the `binaryMessenger`.
  static func setUp(
    binaryMessenger: FlutterBinaryMessenger, api: AppLovinSDKApi?, messageChannelSuffix: String = ""
  ) {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    /// Used to configure GDPR consent on the Android or iOS AppLovin SDK
    let setHasUserConsentChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.gma_mediation_applovin.AppLovinSDKApi.setHasUserConsent\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setHasUserConsentChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let hasUserConsentArg = args[0] as! Bool
        do {
          try api.setHasUserConsent(hasUserConsent: hasUserConsentArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setHasUserConsentChannel.setMessageHandler(nil)
    }
    /// Used to opt out of the sale of personal information in AppLovin SDK.
    let setDoNotSellChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.gma_mediation_applovin.AppLovinSDKApi.setDoNotSell\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setDoNotSellChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let doNotSellArg = args[0] as! Bool
        do {
          try api.setDoNotSell(doNotSell: doNotSellArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setDoNotSellChannel.setMessageHandler(nil)
    }
  }
}
