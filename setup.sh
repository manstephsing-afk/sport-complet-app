<?xml version="1.0" encoding="utf-8"?>
<!--
  styles.xml — Thème sombre EduAdmin (style WhatsApp)
  Copiez dans : android/app/src/main/res/values/styles.xml
-->
<resources>

    <!-- Thème principal — barre de statut sombre -->
    <style name="AppTheme" parent="Theme.AppCompat.DayNight.DarkActionBar">
        <item name="colorPrimary">#00a884</item>
        <item name="colorPrimaryDark">#1f2c34</item>
        <item name="colorAccent">#00a884</item>
        <item name="android:windowBackground">#0a1419</item>
        <item name="android:statusBarColor">#1f2c34</item>
        <item name="android:navigationBarColor">#0a1419</item>
        <item name="android:windowLightStatusBar">false</item>
        <item name="android:windowLightNavigationBar">false</item>
    </style>

    <!-- Thème au lancement (SplashScreen) — fond sombre -->
    <style name="AppTheme.NoActionBarLaunch" parent="Theme.SplashScreen">
        <item name="android:background">#0a1419</item>
        <item name="android:statusBarColor">#0a1419</item>
        <item name="android:navigationBarColor">#0a1419</item>
        <item name="android:windowLightStatusBar">false</item>
        <item name="android:windowLightNavigationBar">false</item>
        <item name="postSplashScreenTheme">@style/AppTheme.NoActionBar</item>
        <item name="windowSplashScreenBackground">#0a1419</item>
        <item name="windowSplashScreenAnimatedIcon">@mipmap/ic_launcher</item>
    </style>

    <!-- Thème sans ActionBar (utilisé par MainActivity) -->
    <style name="AppTheme.NoActionBar" parent="AppTheme">
        <item name="windowActionBar">false</item>
        <item name="windowNoTitle">true</item>
        <item name="android:windowFullscreen">false</item>
        <item name="android:windowStatusBar">true</item>
    </style>

</resources>
