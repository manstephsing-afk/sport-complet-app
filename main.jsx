// android/app/build.gradle
// Ce fichier remplace celui généré par Capacitor

apply plugin: 'com.android.application'

android {
    namespace "com.eduadmin.app"
    compileSdk 34

    defaultConfig {
        applicationId "com.eduadmin.app"
        minSdk 22
        targetSdk 34
        versionCode 1
        versionName "1.0.0"
        testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
        aaptOptions {
            // Garde tous les assets web
            ignoreAssetsPattern '!.svn:!.git:!.ds_store:!*.scc:.*:!CVS:!thumbs.db:!picasa.ini:!*~'
        }
    }

    signingConfigs {
        release {
            // Chargé depuis les variables d'environnement CI (GitHub Actions)
            def keystoreFile = System.getenv("KEYSTORE_FILE") ?
                file(System.getenv("KEYSTORE_FILE")) : null

            if (keystoreFile && keystoreFile.exists()) {
                storeFile keystoreFile
                storePassword System.getenv("KEYSTORE_PASSWORD") ?: ""
                keyAlias System.getenv("KEY_ALIAS") ?: "eduadmin"
                keyPassword System.getenv("KEY_PASSWORD") ?: ""
            }
        }
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'

            def ks = signingConfigs.release.storeFile
            if (ks != null && ks.exists()) {
                signingConfig signingConfigs.release
            }
        }
        debug {
            applicationIdSuffix ".debug"
            versionNameSuffix "-debug"
        }
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }
}

repositories {
    google()
    mavenCentral()
}

dependencies {
    implementation fileTree(include: ['*.jar'], dir: 'libs')
    implementation "androidx.appcompat:appcompat:1.6.1"
    implementation project(':capacitor-android')
    implementation "androidx.coordinatorlayout:coordinatorlayout:1.2.0"
    implementation "androidx.core:core-splashscreen:1.0.1"
}

apply from: 'capacitor.build.gradle'
