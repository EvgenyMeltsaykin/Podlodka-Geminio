package ${packageName}.internal.logic.store

import com.arkivanov.mvikotlin.core.store.Reducer
import com.arkivanov.mvikotlin.core.store.SimpleBootstrapper
import com.arkivanov.mvikotlin.core.store.Store
import com.arkivanov.mvikotlin.core.store.StoreFactory
import com.arkivanov.mvikotlin.extensions.coroutines.CoroutineExecutor
import ${packageName}.internal.logic.store.${storeName}.Intent
import ${packageName}.internal.logic.store.${storeName}.Label
import ${packageName}.internal.logic.store.${storeName}.State
import ${packageName}.internal.logic.store.${storeName}.Message

internal class ${storeFactoryName}(
    private val storeFactory: StoreFactory,
    private val initialState: State,
) {
    fun create(): ${storeName} = object : ${storeName}, Store<Intent, State, Label> by storeFactory.create(
        name = ${storeName}::class.simpleName,
        initialState = initialState,
        bootstrapper = SimpleBootstrapper(Unit),
        executorFactory = ::DefaultExecutor,
        reducer = DefaultReducer,
    ) {}

     private inner class DefaultExecutor : CoroutineExecutor<Intent, Unit, State, Message, Label>() {
         override fun executeIntent(intent: Intent) {
             when (intent) {

             }
         }
     }

     private object DefaultReducer : Reducer<State, Message> {
         override fun State.reduce(msg: Message): State {
             return when (msg) {

             }
         }
     }
}

