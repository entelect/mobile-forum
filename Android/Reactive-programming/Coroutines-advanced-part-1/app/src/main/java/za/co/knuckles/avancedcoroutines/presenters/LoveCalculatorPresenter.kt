package za.co.knuckles.avancedcoroutines.presenters

import za.co.knuckles.avancedcoroutines.repositories.ILoveCalculatorRepository
import za.co.knuckles.avancedcoroutines.view.IMainView

class LoveCalculatorPresenter(private val loveCalculatorRepository: ILoveCalculatorRepository) :
    ILoveCalculatorPresenter {

    private lateinit var mainView: IMainView

    override fun setView(mainView: IMainView) {
        this.mainView = mainView
    }

    override fun calculateLovePercentage(firstName: String, secondName: String) {
        this.loveCalculatorRepository.calculateLovePercentage(firstName, secondName,
            onSuccess = { result -> this.mainView.handleCurrentResult(result)},
            onError = {throwable -> this.mainView.showError(throwable) }
        )
    }

    override fun getData() {
        this.loveCalculatorRepository.getPreviousLoveCalculations { this.mainView.showPreviousResults(it) }
    }

}
