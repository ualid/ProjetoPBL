
<%@ page import="sisap.Atividade" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'atividade.label', default: 'Atividade')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="wrapper">

    <div class="content" id="container">
        <div class="title"><h5><g:message code="default.show.label" args="[entityName]" /></h5></div>
        <div class="breadCrumbHolder module">
            <div class="breadCrumb module">
                <ul>
                    <li class="firstB"><a href="#">Home</a> </li>
                    <li><g:link action="index"> <g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link action="show" id="${atividadeInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${atividadeInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${atividadeInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                            <div class="nNote nFailure hideit">
                                <p><strong>Erro: </strong><g:message error="${error}"/></p>
                            </div>

                        </li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>
        <g:if test="${flash.message}">
            <div class="pt20">
                <div class="nNote nSuccess hideit">
                    <p><strong>Sucesso: </strong>${flash.message}</p>
                </div>
            </div>
        </g:if>
        <div class="middleNav">
            <g:form name="formShow" method="POST"  action="delete">
                <g:hiddenField name="id" value="${atividadeInstance.id}" />
                <ul>
                    <li class="iEdit"><g:link id="${atividadeInstance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
                    <li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'atividade.label', default: 'Atividade')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados do teste</h5></div>
                    
                    <g:if test="${atividadeInstance?.descricao}">
                        <div class="rowElem"><label><span id="descricao-label" class="property-label"><g:message code="atividade.descricao.label" default="Descricao" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="descricao-label"><g:textField readonly="readonly" name="${atividadeInstance}" value="${atividadeInstance.descricao}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadeInstance?.nome}">
                        <div class="rowElem"><label><span id="nome-label" class="property-label"><g:message code="atividade.nome.label" default="Nome" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="nome-label"><g:textField readonly="readonly" name="${atividadeInstance}" value="${atividadeInstance.nome}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadeInstance?.data_inicio}">
                        <div class="rowElem"><label><span id="data_inicio-label" class="property-label"><g:message code="atividade.data_inicio.label" default="Datainicio" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="data_inicio-label"><g:formatDate date="${atividadeInstance?.data_inicio}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadeInstance?.quantidade_horas}">
                        <div class="rowElem"><label><span id="quantidade_horas-label" class="property-label"><g:message code="atividade.quantidade_horas.label" default="Quantidadehoras" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="quantidade_horas-label"><g:textField readonly="readonly" name="${atividadeInstance}" value="${atividadeInstance.quantidade_horas}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadeInstance?.atividade}">
                        <div class="rowElem"><label><span id="atividade-label" class="property-label"><g:message code="atividade.atividade.label" default="Atividade" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="atividade-label"><g:link controller="atividade" action="show" id="${atividadeInstance?.atividade?.id}">${atividadeInstance?.atividade?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadeInstance?.data_fim}">
                        <div class="rowElem"><label><span id="data_fim-label" class="property-label"><g:message code="atividade.data_fim.label" default="Datafim" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="data_fim-label"><g:formatDate date="${atividadeInstance?.data_fim}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadeInstance?.disciplina}">
                        <div class="rowElem"><label><span id="disciplina-label" class="property-label"><g:message code="atividade.disciplina.label" default="Disciplina" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="disciplina-label"><g:link controller="disciplina" action="show" id="${atividadeInstance?.disciplina?.id}">${atividadeInstance?.disciplina?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadeInstance?.tipoAtividade}">
                        <div class="rowElem"><label><span id="tipoAtividade-label" class="property-label"><g:message code="atividade.tipoAtividade.label" default="Tipo Atividade" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="tipoAtividade-label"><g:link controller="tipoAtividade2" action="show" id="${atividadeInstance?.tipoAtividade?.id}">${atividadeInstance?.tipoAtividade?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <div class="fix"></div>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="fix"></div>
</div>
</body>
</html>
