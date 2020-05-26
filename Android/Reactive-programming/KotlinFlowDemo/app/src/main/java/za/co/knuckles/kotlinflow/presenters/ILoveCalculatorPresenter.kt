package za.co.knuckles.kotlinflow.presenters

import za.co.knuckles.kotlinflow.view.IMainView

interface ILoveCalculatorPresenter{
    fun setView(mainView: IMainView)

    fun calculateLovePercentage(firstName: String, secondName: String)

    fun getData()

    fun stop()
}