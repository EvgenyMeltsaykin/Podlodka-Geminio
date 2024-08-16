package ${packageName}

<#if includeScaffold>
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
</#if>
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue

@Composable
internal fun ${screenName}(
    component: ${componentName},
    modifier: Modifier = Modifier,
) {
    val componentState by component.state.collectAsState()
    <#if includeScaffold>

    Scaffold(
        modifier = modifier,
        topBar = {

        }
    ) { scaffoldPadding ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(scaffoldPadding)
        ) {

        }
    }
    </#if>
}