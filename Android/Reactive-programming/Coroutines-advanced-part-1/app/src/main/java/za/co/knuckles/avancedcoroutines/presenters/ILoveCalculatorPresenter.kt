package za.co.knuckles.avancedcoroutines.presenters

import za.co.knuckles.avancedcoroutines.view.IMainView

interface ILoveCalculatorPresenter{
    fun setView(mainView: IMainView)

    fun calculateLovePercentage(firstName: String, secondName: String)

    fun getData()
}