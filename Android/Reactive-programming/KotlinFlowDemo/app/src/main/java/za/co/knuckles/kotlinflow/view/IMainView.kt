package za.co.knuckles.kotlinflow.view

import za.co.knuckles.kotlinflow.repositories.api.responses.LoveCalculatorResponseModel
import za.co.knuckles.kotlinflow.repositories.database.models.LoveResult

interface IMainView {

    fun handleCurrentResult(loveCalculatorResponseModel: LoveCalculatorResponseModel)

    fun showPreviousResults(previousResults: List<LoveResult>)

    fun showError(throwable: Throwable)
}