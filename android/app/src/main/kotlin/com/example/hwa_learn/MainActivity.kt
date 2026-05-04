package com.example.hwa_learn

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity(){
    private val channelName = "com.example.hwa_learn/channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setMethodCallHandler {
            call, result ->
            // Dart tarafında invokeMethod("metotAdi") çağrıldığında burası çalışır
            if (call.method == "getNativeData") {
                val data = "Kotlin'den selamlar!" 
                result.success(data)
            } else {
                result.notImplemented()
            }
        }
    }
}
