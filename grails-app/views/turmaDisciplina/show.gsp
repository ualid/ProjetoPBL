
<%@ page import="sisap.TurmaDisciplina" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'turmaDisciplina.label', default: 'TurmaDisciplina')}" />
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
                    <li><g:link action="show" id="${turmaDisciplinaInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${turmaDisciplinaInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${turmaDisciplinaInstance}" var="error">
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
                <g:hiddenField name="id" value="${turmaDisciplinaInstance.id}" />
                <ul>
                    <li class="iEdit"><g:link id="${turmaDisciplinaInstance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
                    <li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'turmaDisciplina.label', default: 'TurmaDisciplina')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados do teste</h5></div>
                    
                    <g:if test="${turmaDisciplinaInstance?.nome_turma}">
                        <div class="rowElem"><label><span id="nome_turma-label" class="property-label"><g:message code="turmaDisciplina.nome_turma.label" default="Nometurma" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="nome_turma-label"><g:textField readonly="readonly" name="${turmaDisciplinaInstance}" value="${turmaDisciplinaInstance.nome_turma}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${turmaDisciplinaInstance?.nome_disciplina}">
                        <div class="rowElem"><label><span id="nome_disciplina-label" class="property-label"><g:message code="turmaDisciplina.nome_disciplina.label" default="Nomedisciplina" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="nome_disciplina-label"><g:textField readonly="readonly" name="${turmaDisciplinaInstance}" value="${turmaDisciplinaInstance.nome_disciplina}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${turmaDisciplinaInstance?.data_fim}">
                        <div class="rowElem"><label><span id="data_fim-label" class="property-label"><g:message code="turmaDisciplina.data_fim.label" default="Datafim" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="data_fim-label"><g:formatDate date="${turmaDisciplinaInstance?.data_fim}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${turmaDisciplinaInstance?.data_inicio}">
                        <div class="rowElem"><label><span id="data_inicio-label" class="property-label"><g:message code="turmaDisciplina.data_inicio.label" default="Datainicio" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="data_inicio-label"><g:formatDate date="${turmaDisciplinaInstance?.data_inicio}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${turmaDisciplinaInstance?.disciplina}">
                        <div class="rowElem"><label><span id="disciplina-label" class="property-label"><g:message code="turmaDisciplina.disciplina.label" default="Disciplina" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="disciplina-label"><g:link controller="disciplina" action="show" id="${turmaDisciplinaInstance?.disciplina?.id}">${turmaDisciplinaInstance?.disciplina?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${turmaDisciplinaInstance?.periodo}">
                        <div class="rowElem"><label><span id="periodo-label" class="property-label"><g:message code="turmaDisciplina.periodo.label" default="Periodo" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="periodo-label"><g:textField readonly="readonly" name="${turmaDisciplinaInstance}" value="${turmaDisciplinaInstance.periodo}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${turmaDisciplinaInstance?.turma}">
                        <div class="rowElem"><label><span id="turma-label" class="property-label"><g:message code="turmaDisciplina.turma.label" default="Turma" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="turma-label"><g:link controller="turma" action="show" id="${turmaDisciplinaInstance?.turma?.id}">${turmaDisciplinaInstance?.turma?.encodeAsHTML()}</g:link></span>
                                
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
