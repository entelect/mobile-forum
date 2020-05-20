package za.co.knuckles.avancedcoroutines.view

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import kotlinx.android.synthetic.main.activity_main.*
import org.koin.android.ext.android.inject
import za.co.knuckles.avancedcoroutines.R
import za.co.knuckles.avancedcoroutines.presenters.ILoveCalculatorPresenter
import za.co.knuckles.avancedcoroutines.repositories.api.responses.LoveCalculatorResponseModel
import za.co.knuckles.avancedcoroutines.repositories.database.models.LoveResult

class MainActivity : AppCompatActivity(), IMainView {

    private val presenter by inject<ILoveCalculatorPresenter>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        this.setupView()

        presenter.setView(this)
        presenter.getData()

    }

    override fun handleCurrentResult(loveCalculatorResponseModel: LoveCalculatorResponseModel) {
        matchPercentage.text = getString(R.string.percentage_result, loveCalculatorResponseModel.percentage)
        matchResult.text = loveCalculatorResponseModel.result
    }

    override fun showPreviousResults(previousResults: List<LoveResult>) {
        if (previousResults.isNotEmpty()) {
            previousResultsHeading.visibility = View.VISIBLE
            previousResultsContainer.text = ""
        }

        for (loveResult in previousResults){
            val line = "${loveResult.firstName} & ${loveResult.secondName} scored ${loveResult.percentage} percent \n"
            previousResultsContainer.append(line)
        }
    }

    override fun showError(throwable: Throwable) {
        //Display error
    }

    private fun setupView(){
        calculate.setOnClickListener{
            if (firstName.text.toString().isBlank() && secondName.text.toString().isBlank()){
                return@setOnClickListener
            }
            this.presenter.calculateLovePercentage(firstName.text.toString(), secondName.text.toString())
        }
    }

    override fun onStop() {
        presenter.stop()
        super.onStop()
    }
}
