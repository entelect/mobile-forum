package za.co.knuckles.avancedcoroutines.dependency_injection

import org.koin.dsl.module
import za.co.knuckles.avancedcoroutines.presenters.ILoveCalculatorPresenter
import za.co.knuckles.avancedcoroutines.presenters.LoveCalculatorPresenter

fun presenterModule() = module {
    single { LoveCalculatorPresenter(get ()) as ILoveCalculatorPresenter }
}