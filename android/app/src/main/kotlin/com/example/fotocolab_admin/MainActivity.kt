package com.fotocolab.admin
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import android.view.WindowManager

class MainActivity : FlutterActivity() {

    private val CHANNEL = "whatsapp_share"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        window.setFlags(
            WindowManager.LayoutParams.FLAG_SECURE,
            WindowManager.LayoutParams.FLAG_SECURE
        )
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->

                if (call.method == "shareMediaToWhatsApp") {

                    val filePath = call.argument<String>("path")
                    if (filePath.isNullOrEmpty()) {
                        result.error("NO_PATH", "File path is null", null)
                        return@setMethodCallHandler
                    }

                    val file = File(filePath)
                    if (!file.exists()) {
                        result.error("FILE_NOT_FOUND", "File does not exist", null)
                        return@setMethodCallHandler
                    }

                    try {
                        // Get content:// URI via FileProvider
                        val uri: Uri = FileProvider.getUriForFile(
                            this,
                            "${applicationContext.packageName}.provider",
                            file
                        )
                        
                        val mime = when (file.extension.lowercase()) {
                        "mp4", "mov", "mkv" -> "video/*"
                        "png", "jpg", "jpeg", "webp" -> "image/*"
                        else -> "*/*"
                        }   

                        val intent = Intent(Intent.ACTION_SEND).apply {
                            type = mime
                            putExtra(Intent.EXTRA_STREAM, uri)
                            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                        }

                        // Prefer normal WhatsApp, fallback to WhatsApp Business if available
                        val packages = listOf("com.whatsapp", "com.whatsapp.w4b")
                        val availablePackage = packages.firstOrNull { pkg ->
                            try {
                                packageManager.getLaunchIntentForPackage(pkg) != null
                            } catch (e: Exception) {
                                false
                            }
                        }

                        if (availablePackage != null) {
                            intent.setPackage(availablePackage)
                        }
                        // Use chooser to avoid Android 14+ launch restrictions
                        val chooser = Intent.createChooser(intent, "Share image to WhatsApp")

                        if (chooser.resolveActivity(packageManager) != null) {
                            activity?.startActivity(chooser)
                            result.success(true)
                        } else {
                            result.error("CANNOT_RESOLVE", "Cannot resolve WhatsApp activity", null)
                        }

                    } catch (e: Exception) {
                        result.error("WA_ERROR", e.message, null)
                    }
                }
            }
    }
}
