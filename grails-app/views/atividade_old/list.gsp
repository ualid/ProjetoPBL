
<%@ page import="sisap.Atividade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'atividade.label', default: 'Atividade')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="content">
        <div class="title"><h5><g:message code="default.list.label" args="[entityName]" /></h5></div>
        <div class="breadCrumbHolder module">
            <div class="breadCrumb module">
                <ul>
                    <li class="firstB"><a href="#">Home</a> </li>
                    <li><g:link action="index"> <g:message code="default.list.label" args="[entityName]" /></g:link></li>

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
            <div class="head"><h5 class="iFrames">Listagem de <g:message code="default.list.label" args="[entityName]" />: ${atividadeInstanceTotal}</h5></div>
            <g:form name="formShow" method="POST"  action="delete">
                <g:hiddenField id="id" name="id" value=""/>
            <table cellpadding="0" cellspacing="0" width="100%" class="tableStatic resize">
				<thead>
					<tr>
					
                        <td>${message(code: 'atividade.descricao.label', default: 'Descricao')}</td>
					
                        <td>${message(code: 'atividade.nome.label', default: 'Nome')}</td>
					
                        <td>${message(code: 'atividade.data_inicio.label', default: 'Datainicio')}</td>
					
                        <td>${message(code: 'atividade.quantidade_horas.label', default: 'Quantidadehoras')}</td>
					
						<td><g:message code="atividade.atividade.label" default="Atividade" /></td>
					
                        <td>${message(code: 'atividade.data_fim.label', default: 'Datafim')}</td>
					
                        <th width="10%">Editar</th>
                        <th width="10%">Excluir</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${atividadeInstanceList}" status="i" var="atividadeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${atividadeInstance.id}">${fieldValue(bean: atividadeInstance, field: "descricao")}</g:link></td>
					
						<td>${fieldValue(bean: atividadeInstance, field: "nome")}</td>
					
						<td><g:formatDate date="${atividadeInstance.data_inicio}" /></td>
					
						<td>${fieldValue(bean: atividadeInstance, field: "quantidade_horas")}</td>
					
						<td>${fieldValue(bean: atividadeInstance, field: "atividade")}</td>
					
						<td><g:formatDate date="${atividadeInstance.data_fim}" /></td>
					
                        <td align="center"><g:link action="edit" id="${atividadeInstance.id}"><img src="${createLinkTo(dir: 'images/icons/middlenav', file: 'pencil.png')}" style="width: 15px;height: 15px;" /></g:link></td>
                        <td align="center"><div id="auxDiv${atividadeInstance.id}"></div><a href="#auxDiv${atividadeInstance.id}" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'atividade.label', default: 'Artefact > Atividade')}?', 'Confirmação', function(e){if(e){
                        $('#id').val('${atividadeInstance.id}');$('form#formShow').submit();
                        $('#id').val('')}});"><img src="${createLinkTo(dir: 'images/icons/middlenav', file: 'trash.png')}" style="width: 15px;height: 15px;" /></a></td>
					</tr>
				</g:each>
				</tbody>
			</table>
                </g:form>
            </div>
        <div class="pagination">
            <ul class="pages">
                <g:paginateCustom total="${atividadeInstanceTotal}" />
            </ul>
        </div>
        <g:link style="float: right;" action="create" ><button class="greyishBtn">Adicionar</button></g:link>

		</div>
    <div class="fix"></div>
	</body>
</html>
