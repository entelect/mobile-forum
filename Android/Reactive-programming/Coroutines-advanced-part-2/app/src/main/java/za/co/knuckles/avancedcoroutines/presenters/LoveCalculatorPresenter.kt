package za.co.knuckles.avancedcoroutines.presenters

import kotlinx.coroutines.*
import za.co.knuckles.avancedcoroutines.repositories.ILoveCalculatorRepository
import za.co.knuckles.avancedcoroutines.view.IMainView
import kotlin.coroutines.CoroutineContext

class LoveCalculatorPresenter(private val loveCalculatorRepository: ILoveCalculatorRepository) :
    ILoveCalculatorPresenter, CoroutineScope {

    private lateinit var mainView: IMainView
    private val job = SupervisorJob()

    private val coroutineExceptionHandler =
        CoroutineExceptionHandler { coroutineContext, throwable ->
            //Do something with this error
        }

    override val coroutineContext: CoroutineContext
        get() = Dispatchers.Main + job + coroutineExceptionHandler// Main first approach

    override fun setView(mainView: IMainView) {
        this.mainView = mainView
    }

    override fun calculateLovePercentage(firstName: String, secondName: String) {
        launch {
            val result = runCatching {
                this@LoveCalculatorPresenter.loveCalculatorRepository.calculateLovePercentage(
                    firstName,
                    secondName
                )
            }

            result.onSuccess {
                this@LoveCalculatorPresenter.mainView.handleCurrentResult(it)
                this@LoveCalculatorPresenter.getData()
            }
            .onFailure {
                    this@LoveCalculatorPresenter.mainView.showError(it)
           }
        }
    }

    override fun getData() {
        launch {

            val result = runCatching {
                this@LoveCalculatorPresenter.loveCalculatorRepository.getPreviousLoveCalculations() }
            result.onSuccess {
                this@LoveCalculatorPresenter.mainView.showPreviousResults(it)
            }
        }
    }

    //Must stop the job
    override fun stop() {
        job.cancelChildren()
    }
}
