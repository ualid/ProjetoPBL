
<%@ page import="sisap.Atividade2" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'atividade2.label', default: 'Atividade2')}" />
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
            <div class="head"><h5 class="iFrames">Listagem de <g:message code="default.list.label" args="[entityName]" />: ${atividade2InstanceTotal}</h5></div>
            <g:form name="formShow" method="POST"  action="delete">
                <g:hiddenField id="id" name="id" value=""/>
            <table cellpadding="0" cellspacing="0" width="100%" class="tableStatic resize">
				<thead>
					<tr>
					
                        <td>${message(code: 'atividade2.descricao.label', default: 'Descricao')}</td>
					
                        <td>${message(code: 'atividade2.nome.label', default: 'Nome')}</td>
					
                        <td>${message(code: 'atividade2.data_inicio.label', default: 'Datainicio')}</td>
					
						<td><g:message code="atividade2.atividade.label" default="Atividade" /></td>
					
                        <td>${message(code: 'atividade2.quantidade_horas.label', default: 'Quantidadehoras')}</td>
					
                        <td>${message(code: 'atividade2.ativo.label', default: 'Ativo')}</td>
					
                        <th width="10%">Editar</th>
                        <th width="10%">Excluir</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${atividade2InstanceList}" status="i" var="atividade2Instance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${atividade2Instance.id}">${fieldValue(bean: atividade2Instance, field: "descricao")}</g:link></td>
					
						<td>${fieldValue(bean: atividade2Instance, field: "nome")}</td>
					
						<td><g:formatDate date="${atividade2Instance.data_inicio}" /></td>
					
						<td>${fieldValue(bean: atividade2Instance, field: "atividade")}</td>
					
						<td>${fieldValue(bean: atividade2Instance, field: "quantidade_horas")}</td>
					
						<td>${fieldValue(bean: atividade2Instance, field: "ativo")}</td>
					
                        <td align="center"><g:link action="edit" id="${atividade2Instance.id}"><img src="${createLinkTo(dir: 'images/icons/middlenav', file: 'pencil.png')}" style="width: 15px;height: 15px;" /></g:link></td>
                        <td align="center"><div id="auxDiv${atividade2Instance.id}"></div><a href="#auxDiv${atividade2Instance.id}" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'atividade2.label', default: 'Artefact > Atividade2')}?', 'Confirmação', function(e){if(e){
                        $('#id').val('${atividade2Instance.id}');$('form#formShow').submit();
                        $('#id').val('')}});"><img src="${createLinkTo(dir: 'images/icons/middlenav', file: 'trash.png')}" style="width: 15px;height: 15px;" /></a></td>
					</tr>
				</g:each>
				</tbody>
			</table>
                </g:form>
            </div>
        <div class="pagination">
            <ul class="pages">
                <g:paginateCustom total="${atividade2InstanceTotal}" />
            </ul>
        </div>
        <g:link style="float: right;" action="create" ><button class="greyishBtn">Adicionar</button></g:link>

		</div>
    <div class="fix"></div>
	</body>
</html>
