# Keep all kotlinx parcelize classes
-keep class kotlinx.parcelize.** { *; }

# Prevent removal of Giphy SDK classes
-keep class com.giphy.sdk.** { *; }

# Preserve annotations used by Parcelize and other libraries
-keepattributes *Annotation*

# Suppress warnings related to kotlinx and Giphy SDK
-dontwarn kotlinx.parcelize.**
-dontwarn com.giphy.sdk.**

# Optional: If you need to debug the Proguard configuration
-keep class kotlinx.** { *; }
-keepclassmembers class ** {
    @kotlin.Metadata *;
}
