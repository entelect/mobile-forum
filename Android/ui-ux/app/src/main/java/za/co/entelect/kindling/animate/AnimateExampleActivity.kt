package za.co.entelect.kindling.animate

import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_animate_example.*
import za.co.entelect.kindling.R

class AnimateExampleActivity : AppCompatActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_animate_example)
    }

    private val animationDuration: Long
        get() = resources.getInteger(android.R.integer.config_mediumAnimTime).toLong()

    fun onShowTapped(view: View) = startAnimation(0f, 1f)

    fun onHideTapped(view: View) = startAnimation(1f, 0f)

    private fun startAnimation(startAlpha: Float, endAlpha: Float) {
        imageToAnimate.apply {
            alpha = startAlpha
            animate().apply {
                alpha(endAlpha)
                duration = animationDuration
            }
        }
    }

    // Method here for demo purposes
//    private fun animateUsingObjectAnimator(startAlpha: Float, endAlpha: Float) {
//        imageToAnimate.alpha = startAlpha
//        ObjectAnimator.ofFloat(imageToAnimate, "alpha", endAlpha).apply {
//            duration = animationDuration
//            start()
//        }
//    }
}