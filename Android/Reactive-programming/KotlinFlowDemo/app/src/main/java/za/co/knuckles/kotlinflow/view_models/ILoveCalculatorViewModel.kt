package za.co.knuckles.kotlinflow.view_models

import kotlinx.coroutines.flow.Flow
import za.co.knuckles.kotlinflow.repositories.database.models.LoveResult
import za.co.knuckles.kotlinflow.view.IMainView

interface ILoveCalculatorViewModel {
    fun setView(mainView: IMainView)

    fun calculateLovePercentage(firstName: String, secondName: String)

    fun getData()

    var previousResultsUsingFlow: Flow<List<LoveResult>>
}