package za.co.knuckles.kotlinflow.dependency_injection

import org.koin.android.viewmodel.dsl.viewModel
import org.koin.dsl.module
import za.co.knuckles.kotlinflow.view_models.LoveCalculatorViewModel

fun viewModelModule() = module {
    viewModel { LoveCalculatorViewModel(get ()) }
}