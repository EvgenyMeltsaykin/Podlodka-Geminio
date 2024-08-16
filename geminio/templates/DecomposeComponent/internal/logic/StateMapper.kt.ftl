package ${packageName}.internal.logic

import ${packageName}.internal.logic.store.${storeName}
import ${packageName}.api.state.${uiStateName}

internal val stateToStateUi: (${storeName}.State) -> ${uiStateName} = { state ->
    ${uiStateName}(

    )
}