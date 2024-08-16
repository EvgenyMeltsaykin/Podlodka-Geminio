package ${packageName}.data.repository

import ${packageName}.domain.repository.${repositoryName}
<#if includeNetwork>import ${packageName}.data.network.${serviceApiName}</#if>

internal class ${defaultRepositoryName}(
<#if includeNetwork>private val serviceApi: ${serviceApiName},</#if>
) : ${repositoryName}{

}