package za.co.knuckles.avancedcoroutines.view_models

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.*
import za.co.knuckles.avancedcoroutines.repositories.ILoveCalculatorRepository
import za.co.knuckles.avancedcoroutines.view.IMainView
import kotlin.coroutines.CoroutineContext

class LoveCalculatorViewModel (private val loveCalculatorRepository: ILoveCalculatorRepository) : ViewModel(),
    ILoveCalculatorViewModel {

    private lateinit var mainView: IMainView
    private val job = SupervisorJob()

    private val coroutineExceptionHandler =
        CoroutineExceptionHandler { coroutineContext, throwable ->
            //Do something with this error
        }

    override fun setView(mainView: IMainView) {
        this.mainView = mainView
    }

    override fun calculateLovePercentage(firstName: String, secondName: String) {
        viewModelScope.launch(coroutineExceptionHandler) {
            val result = runCatching {
                this@LoveCalculatorViewModel.loveCalculatorRepository.calculateLovePercentage(
                    firstName,
                    secondName
                )
            }

            result.onSuccess {
                this@LoveCalculatorViewModel.mainView.handleCurrentResult(it)
                this@LoveCalculatorViewModel.getData()
            }
                .onFailure {
                    this@LoveCalculatorViewModel.mainView.showError(it)
                }
        }
    }

    override fun getData() {
        viewModelScope.launch(coroutineExceptionHandler) {

            val result = runCatching {
                this@LoveCalculatorViewModel.loveCalculatorRepository.getPreviousLoveCalculations() }
            result.onSuccess {
                this@LoveCalculatorViewModel.mainView.showPreviousResults(it)
            }
        }
    }
}