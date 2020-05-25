package za.co.knuckles.avancedcoroutines.dependency_injection

import org.koin.android.viewmodel.dsl.viewModel
import org.koin.dsl.module
import za.co.knuckles.avancedcoroutines.presenters.ILoveCalculatorPresenter
import za.co.knuckles.avancedcoroutines.presenters.LoveCalculatorPresenter
import za.co.knuckles.avancedcoroutines.view_models.LoveCalculatorViewModel

fun viewModelModule() = module {
    viewModel { LoveCalculatorViewModel(get ()) }
}