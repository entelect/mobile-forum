package za.co.knuckles.avancedcoroutines.dependency_injection

import org.koin.android.ext.koin.androidContext
import org.koin.dsl.module
import za.co.knuckles.avancedcoroutines.repositories.ILoveCalculatorRepository
import za.co.knuckles.avancedcoroutines.repositories.LoveCalculatorRepository
import za.co.knuckles.avancedcoroutines.repositories.database.LoveCalculatorDatabase

fun appModule() = module {
    single { LoveCalculatorDatabase.create(androidContext()) }

    single {get<LoveCalculatorDatabase>().loveDao()}

    single { LoveCalculatorRepository(get(), get()) as ILoveCalculatorRepository }
}