package za.co.knuckles.kotlinflow.view

import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*
import org.koin.android.viewmodel.ext.android.viewModel
import za.co.knuckles.kotlinflow.R
import za.co.knuckles.kotlinflow.repositories.api.responses.LoveCalculatorResponseModel
import za.co.knuckles.kotlinflow.repositories.database.models.LoveResult
import za.co.knuckles.kotlinflow.view_models.ILoveCalculatorViewModel
import za.co.knuckles.kotlinflow.view_models.LoveCalculatorViewModel

class MainActivity() : AppCompatActivity(), IMainView {

    private val viewModel: ILoveCalculatorViewModel by viewModel<LoveCalculatorViewModel>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        this.setupView()

        viewModel.setView(this)
        viewModel.getData()
    }

    override fun handleCurrentResult(loveCalculatorResponseModel: LoveCalculatorResponseModel) {
        matchPercentage.text =
            getString(R.string.percentage_result, loveCalculatorResponseModel.percentage)
        matchResult.text = loveCalculatorResponseModel.result
    }

    override fun showPreviousResults(previousResults: List<LoveResult>) {
        if (previousResults.isNotEmpty()) {
            previousResultsHeading.visibility = View.VISIBLE
            previousResultsContainer.text = ""
        }

        for (loveResult in previousResults) {
            val line =
                "${loveResult.firstName} & ${loveResult.secondName} scored ${loveResult.percentage} percent \n"
            previousResultsContainer.append(line)
        }
    }

    override fun showError(throwable: Throwable) {
        TODO("Not yet implemented")
    }

    private fun setupView() {
        calculate.setOnClickListener {
            if (firstName.text.toString().isBlank() && secondName.text.toString().isBlank()) {
                return@setOnClickListener
            }
            this.viewModel.calculateLovePercentage(
                firstName.text.toString(),
                secondName.text.toString()
            )
        }
    }
}
