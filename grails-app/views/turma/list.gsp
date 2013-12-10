
<%@ page import="sisap.Turma" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'turma.label', default: 'Turma')}" />
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
            <div class="head"><h5 class="iFrames">Listagem de <g:message code="default.list.label" args="[entityName]" />: ${turmaInstanceTotal}</h5></div>
            <g:form name="formShow" method="POST"  action="delete">
                <g:hiddenField id="id" name="id" value=""/>
            <table cellpadding="0" cellspacing="0" width="100%" class="tableStatic resize">
				<thead>
					<tr>
					
                        <td>${message(code: 'turma.nome.label', default: 'Nome')}</td>
					
                        <td>${message(code: 'turma.data_inicio.label', default: 'Datainicio')}</td>
					
                        <td>${message(code: 'turma.data_fim.label', default: 'Datafim')}</td>
					
                        <td>${message(code: 'turma.descricao.label', default: 'Descricao')}</td>
					
						<td><g:message code="turma.turmaDisciplina.label" default="Turma Disciplina" /></td>
					
                        <th width="10%">Editar</th>
                        <th width="10%">Excluir</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${turmaInstanceList}" status="i" var="turmaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${turmaInstance.id}">${fieldValue(bean: turmaInstance, field: "nome")}</g:link></td>
					
						<td><g:formatDate date="${turmaInstance.data_inicio}" /></td>
					
						<td><g:formatDate date="${turmaInstance.data_fim}" /></td>
					
						<td>${fieldValue(bean: turmaInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: turmaInstance, field: "turmaDisciplina")}</td>
					
                        <td align="center"><g:link action="edit" id="${turmaInstance.id}"><img src="${createLinkTo(dir: 'images/icons/middlenav', file: 'pencil.png')}" style="width: 15px;height: 15px;" /></g:link></td>
                        <td align="center"><div id="auxDiv${turmaInstance.id}"></div><a href="#auxDiv${turmaInstance.id}" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'turma.label', default: 'Artefact > Turma')}?', 'Confirmação', function(e){if(e){
                        $('#id').val('${turmaInstance.id}');$('form#formShow').submit();
                        $('#id').val('')}});"><img src="${createLinkTo(dir: 'images/icons/middlenav', file: 'trash.png')}" style="width: 15px;height: 15px;" /></a></td>
					</tr>
				</g:each>
				</tbody>
			</table>
                </g:form>
            </div>
        <div class="pagination">
            <ul class="pages">
                <g:paginateCustom total="${turmaInstanceTotal}" />
            </ul>
        </div>
        <g:link style="float: right;" action="create" ><button class="greyishBtn">Adicionar</button></g:link>

		</div>
    <div class="fix"></div>
	</body>
</html>
