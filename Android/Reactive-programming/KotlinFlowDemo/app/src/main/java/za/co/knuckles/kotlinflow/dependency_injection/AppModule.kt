package za.co.knuckles.kotlinflow.dependency_injection

import org.koin.android.ext.koin.androidContext
import org.koin.dsl.module
import za.co.knuckles.kotlinflow.repositories.ILoveCalculatorRepository
import za.co.knuckles.kotlinflow.repositories.LoveCalculatorRepository
import za.co.knuckles.kotlinflow.repositories.database.LoveCalculatorDatabase

fun appModule() = module {
    single { LoveCalculatorDatabase.create(androidContext()) }

    single {get<LoveCalculatorDatabase>().loveDao()}

    single { LoveCalculatorRepository(get(), get()) as ILoveCalculatorRepository }
}