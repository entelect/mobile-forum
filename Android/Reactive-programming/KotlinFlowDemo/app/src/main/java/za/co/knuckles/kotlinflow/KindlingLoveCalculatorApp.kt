package za.co.knuckles.kotlinflow

import android.app.Application
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.startKoin
import za.co.knuckles.kotlinflow.dependency_injection.appModule
import za.co.knuckles.kotlinflow.dependency_injection.networkingModule
import za.co.knuckles.kotlinflow.dependency_injection.viewModelModule

class KindlingLoveCalculatorApp : Application() {
    override fun onCreate() {
        super.onCreate()
        startKoin {
            androidContext(this@KindlingLoveCalculatorApp)
            modules(listOf(appModule(), networkingModule(), viewModelModule()))
        }
    }
}