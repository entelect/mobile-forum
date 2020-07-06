package za.co.entelect.kindling

import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.app.AppCompatDelegate
import androidx.appcompat.app.AppCompatDelegate.MODE_NIGHT_NO
import androidx.appcompat.app.AppCompatDelegate.MODE_NIGHT_YES
import za.co.entelect.kindling.animate.AnimateExampleActivity
import za.co.entelect.kindling.motionlayout.MotionLayoutExampleActivity
import za.co.entelect.kindling.transition.TransitionExampleActivity

class MainActivity : AppCompatActivity() {

    companion object {
        const val DARK_MODE_ENABLED = "DARK_MODE_ENABLED"
    }

    private var darkModeEnabled: Boolean = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        darkModeEnabled = wasDarkModeEnabled(savedInstanceState)
        updateDarkModeState()
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putBoolean(DARK_MODE_ENABLED, darkModeEnabled)
    }

    fun onDarkThemeSelected(view: View) {
        darkModeEnabled = !darkModeEnabled
        updateDarkModeState()
    }

    fun onMotionLayoutExampleTapped(view: View) {
        startActivity(Intent(this, MotionLayoutExampleActivity::class.java))
    }

    fun onAnimateExampleTapped(view: View) {
        startActivity(Intent(this, AnimateExampleActivity::class.java))
    }

    fun onTransitionExampleTapped(view: View) {
        startActivity(Intent(this, TransitionExampleActivity::class.java))
    }

    private fun updateDarkModeState() {
        val mode = if (darkModeEnabled) MODE_NIGHT_YES else MODE_NIGHT_NO
        AppCompatDelegate.setDefaultNightMode(mode)
    }

    private fun wasDarkModeEnabled(savedInstanceState: Bundle?) =
        savedInstanceState?.getBoolean(DARK_MODE_ENABLED, false) ?: false
}
