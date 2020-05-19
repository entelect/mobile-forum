package za.co.knuckles.avancedcoroutines.presenters

import android.util.Log
import com.nhaarman.mockitokotlin2.any
import org.junit.runner.RunWith
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner
import com.nhaarman.mockitokotlin2.mock
import com.nhaarman.mockitokotlin2.verify
import com.nhaarman.mockitokotlin2.whenever
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.test.TestCoroutineDispatcher
import kotlinx.coroutines.test.TestCoroutineScope
import kotlinx.coroutines.test.runBlockingTest
import kotlinx.coroutines.test.setMain
import org.junit.Before
import org.junit.Test
import org.powermock.api.mockito.PowerMockito
import za.co.knuckles.avancedcoroutines.repositories.ILoveCalculatorRepository
import za.co.knuckles.avancedcoroutines.view.IMainView

@RunWith(PowerMockRunner::class)
@PrepareForTest(Log::class) //if you have logs
class LoveCalculatorPresenterTest {

    private val repository = mock<ILoveCalculatorRepository>()
    private val view = mock<IMainView>()
    private val presenter by lazy { LoveCalculatorPresenter(repository) }

    private val dispatcher = TestCoroutineDispatcher()
    private val coroutineScope = TestCoroutineScope(dispatcher)

    @Before
    fun setUp(){ //runs before each test
        PowerMockito.mockStatic(Log::class.java)

        Dispatchers.setMain(dispatcher)

        presenter.setView(view)
    }

    @Test
    fun testGetPreviousResults() = coroutineScope.runBlockingTest{
        // Arrange
        whenever(repository.getPreviousLoveCalculations()).thenReturn(listOf())

        // Act
        presenter.getData()
        // - simulate delay by advancing time
        advanceTimeBy(100)

        //Assert
        verify(repository).getPreviousLoveCalculations()
        verify(view).showPreviousResults(any())
    }

}
