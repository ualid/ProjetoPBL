
<%@ page import="sisap.Turma" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'turma.label', default: 'Turma')}" />
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
                    <li><g:link action="show" id="${turmaInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${turmaInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${turmaInstance}" var="error">
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
                <g:hiddenField name="id" value="${turmaInstance.id}" />
                <ul>
                    <li class="iEdit"><g:link id="${turmaInstance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
                    <li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'turma.label', default: 'Turma')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados do teste</h5></div>
                    
                    <g:if test="${turmaInstance?.nome}">
                        <div class="rowElem"><label><span id="nome-label" class="property-label"><g:message code="turma.nome.label" default="Nome" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="nome-label"><g:textField readonly="readonly" name="${turmaInstance}" value="${turmaInstance.nome}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${turmaInstance?.data_inicio}">
                        <div class="rowElem"><label><span id="data_inicio-label" class="property-label"><g:message code="turma.data_inicio.label" default="Datainicio" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="data_inicio-label"><g:formatDate date="${turmaInstance?.data_inicio}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${turmaInstance?.data_fim}">
                        <div class="rowElem"><label><span id="data_fim-label" class="property-label"><g:message code="turma.data_fim.label" default="Datafim" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="data_fim-label"><g:formatDate date="${turmaInstance?.data_fim}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${turmaInstance?.descricao}">
                        <div class="rowElem"><label><span id="descricao-label" class="property-label"><g:message code="turma.descricao.label" default="Descricao" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="descricao-label"><g:textField readonly="readonly" name="${turmaInstance}" value="${turmaInstance.descricao}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${turmaInstance?.turmaDisciplina}">
                        <div class="rowElem"><label><span id="turmaDisciplina-label" class="property-label"><g:message code="turma.turmaDisciplina.label" default="Turma Disciplina" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="turmaDisciplina-label"><g:link controller="turmaDisciplina" action="show" id="${turmaInstance?.turmaDisciplina?.id}">${turmaInstance?.turmaDisciplina?.encodeAsHTML()}</g:link></span>
                                
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
