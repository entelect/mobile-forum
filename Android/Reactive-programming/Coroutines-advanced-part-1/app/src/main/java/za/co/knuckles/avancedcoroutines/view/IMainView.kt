package za.co.knuckles.avancedcoroutines.view

import za.co.knuckles.avancedcoroutines.repositories.api.responses.LoveCalculatorResponseModel
import za.co.knuckles.avancedcoroutines.repositories.database.models.LoveResult

interface IMainView {

    fun handleCurrentResult(loveCalculatorResponseModel: LoveCalculatorResponseModel)

    fun showPreviousResults(previousResults: List<LoveResult>)

    fun showError(throwable: Throwable)
}