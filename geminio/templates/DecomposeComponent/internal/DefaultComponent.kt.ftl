package ${packageName}.internal

import com.arkivanov.decompose.ComponentContext
import com.arkivanov.essenty.lifecycle.doOnDestroy
import com.arkivanov.mvikotlin.core.instancekeeper.getStore
import com.arkivanov.mvikotlin.extensions.coroutines.labels
import com.arkivanov.mvikotlin.extensions.coroutines.stateFlow
import kotlinx.coroutines.flow.StateFlow
import ${packageName}.api.${componentName}
import ${packageName}.api.${dependenciesName}
import ${packageName}.internal.logic.stateToStateUi
import ${packageName}.internal.logic.store.${storeName}
import ${packageName}.internal.logic.store.${storeFactoryName}
import ${packageName}.api.state.${uiStateName}
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.onEach
import kotlinx.coroutines.flow.stateIn

internal class ${defaultComponentName}(
    componentContext: ComponentContext,
    private val dependencies: ${dependenciesName},
) : ${componentName},
    ComponentContext by componentContext {

    private val coroutineScope = CoroutineScope(Dispatchers.Main.immediate + SupervisorJob())

    private val initialState = ${storeName}.State.initial()

    private val store = instanceKeeper.getStore {
        ${storeFactoryName}(
            storeFactory = dependencies.storeFactory,
            initialState = initialState,
        ).create()
    }

    init {
        lifecycle.doOnDestroy { coroutineScope.cancel() }

        store.labels.onEach { label ->
           
        }.launchIn(coroutineScope)
    }

    @OptIn(ExperimentalCoroutinesApi::class)
    override val state: StateFlow<${uiStateName}> = store
        .stateFlow
        .map(stateToStateUi)
        .stateIn(
            scope = coroutineScope,
            started = SharingStarted.Eagerly,
            initialValue = stateToStateUi(initialState)
        )
}