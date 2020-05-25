package za.co.knuckles.avancedcoroutines

import android.app.Application
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.startKoin
import za.co.knuckles.avancedcoroutines.dependency_injection.appModule
import za.co.knuckles.avancedcoroutines.dependency_injection.networkingModule
import za.co.knuckles.avancedcoroutines.dependency_injection.presenterModule

class KindlingLoveCalculatorApp : Application() {
    override fun onCreate() {
        super.onCreate()
        startKoin {
            androidContext(this@KindlingLoveCalculatorApp)
            modules(listOf(appModule(), networkingModule(), presenterModule()))
        }
    }
}