package za.co.knuckles.kotlinflow.view_models

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.flowOf
import za.co.knuckles.kotlinflow.repositories.ILoveCalculatorRepository
import za.co.knuckles.kotlinflow.repositories.database.models.LoveResult
import za.co.knuckles.kotlinflow.view.IMainView

//Runs on the main thread by default
class LoveCalculatorViewModel(private val loveCalculatorRepository: ILoveCalculatorRepository) :
    ViewModel(),
    ILoveCalculatorViewModel {

    private lateinit var mainView: IMainView

    private val coroutineExceptionHandler =
        CoroutineExceptionHandler { coroutineContext, throwable ->
            //Do something with this error
        }

    override fun setView(mainView: IMainView) {
        this.mainView = mainView
    }

    override var previousResultsUsingFlow: Flow<List<LoveResult>> =
        loveCalculatorRepository.getPreviousLoveCalculations()

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
            }
                .onFailure {
                    this@LoveCalculatorViewModel.mainView.showError(it)
                }
        }
    }

    override fun getData() {
        viewModelScope.launch() {
            previousResultsUsingFlow.collect { result ->
                this@LoveCalculatorViewModel.mainView.showPreviousResults(result)
            }
        }
    }
}