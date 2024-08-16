package ${packageName}.api

<#if includeFactory>import com.arkivanov.decompose.ComponentContext</#if>
import kotlinx.coroutines.flow.StateFlow
import ${packageName}.api.state.${uiStateName}
import ${packageName}.internal.${defaultComponentName}

interface ${componentName} {
     val state: StateFlow<${uiStateName}>
     <#if includeFactory>
     
     companion object{
        fun create(
            componentContext: ComponentContext,
            dependencies: ${dependenciesName},
        ) : ${componentName}{
            return ${defaultComponentName}(
                componentContext = componentContext,
                dependencies = dependencies,
            )
        }
     }
     </#if>
}