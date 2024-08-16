package ${packageName}.internal.logic.store

import com.arkivanov.mvikotlin.core.store.Store
import ${packageName}.internal.logic.store.${storeName}.Intent
import ${packageName}.internal.logic.store.${storeName}.Label
import ${packageName}.internal.logic.store.${storeName}.State

internal interface ${storeName} : Store<Intent, State, Label> {

    sealed interface Intent {

    }

    sealed interface Message {

    }

    sealed interface Label {

    }

    class State(

    ) {
        companion object {
            fun initial(): State {
                return State(

                )
            }
        }
    }
}

