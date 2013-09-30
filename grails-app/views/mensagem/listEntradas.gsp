
<%@ page import="sisap.Mensagem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="content">
        <div class="title"><h5><g:message code="default.list.label" args="[entityName]" /></h5></div>
        <div class="breadCrumbHolder module">
            <div class="breadCrumb module">
                <ul>
                    <li class="firstB"><a href="#">Home</a> </li>
                    <li><g:link action="listEntradas"> <g:message code="default.list.label" args="[entityName]" /></g:link></li>

                </ul>
            </div>
        </div>

			<g:if test="${flash.message}">
                <div class="pt20">
                    <div class="nNote nSuccess hideit">
                        <p><strong>Sucesso: </strong>${flash.message}</p>
                    </div>
                </div>
			</g:if>
        <div class="fix"></div>
        <div class="table">
            <div class="head"><h5 class="iFrames">Listagem de <g:message code="default.list.label" args="[entityName]" />: ${mensagemInstanceTotal}</h5></div>
            <g:form name="formShow" method="POST"  action="delete">
                <g:hiddenField id="id" name="id" value=""/>
            <table cellpadding="0" cellspacing="0" width="100%" class="tableStatic resize">
				<thead>
					<tr>
					
                        <td>${message(code: 'mensagem.titulo.label', default: 'Titulo')}</td>
					

					     <th>Remetente</th>

					</tr>
				</thead>
				<tbody>
				<g:each in="${mensagemInstanceList}" status="i" var="mensagemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mensagemInstance.id}">
                            ${!mensagemInstance.lida ?  "<b>":""}
                            ${mensagemInstance?.mensagem?.titulo}
                            ${!mensagemInstance.lida ?  "</b>":""}
                        </g:link>
                        </td>
					    <td>${mensagemInstance?.mensagem?.remetente?.nome}</td>
                        <td>${mensagemInstance?.mensagem?.mensagem?.substring(0, mensagemInstance?.mensagem?.mensagem.length() > 20 ? 20:mensagemInstance?.mensagem?.mensagem?.length())}${mensagemInstance?.mensagem?.mensagem?.length() > 20 ? "...":""}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
                </g:form>
            </div>
        <div class="pagination">
            <ul class="pages">
                <g:paginateCustom total="${mensagemInstanceTotal}" />
            </ul>
        </div>
        <g:link style="float: right;" action="create" ><button class="greyishBtn">Adicionar</button></g:link>

		</div>
    <div class="fix"></div>
	</body>
</html>
