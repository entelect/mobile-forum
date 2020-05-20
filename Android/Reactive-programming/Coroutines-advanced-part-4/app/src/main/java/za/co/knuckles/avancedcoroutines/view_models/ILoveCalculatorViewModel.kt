package za.co.knuckles.avancedcoroutines.view_models

import za.co.knuckles.avancedcoroutines.view.IMainView

interface ILoveCalculatorViewModel {
    fun setView(mainView: IMainView)

    fun calculateLovePercentage(firstName: String, secondName: String)

    fun getData()
}