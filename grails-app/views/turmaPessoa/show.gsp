
<%@ page import="sisap.TurmaPessoa" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'turmaPessoa.label', default: 'TurmaPessoa')}" />
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
                    <li><g:link action="show" id="${turmaPessoaInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${turmaPessoaInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${turmaPessoaInstance}" var="error">
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
                <g:hiddenField name="id" value="${turmaPessoaInstance.id}" />
                <ul>
                    <li class="iEdit"><g:link id="${turmaPessoaInstance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
                    <li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'turmaPessoa.label', default: 'TurmaPessoa')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados do teste</h5></div>
                    
                    <g:if test="${turmaPessoaInstance?.cod_Turma}">
                        <div class="rowElem"><label><span id="cod_Turma-label" class="property-label"><g:message code="turmaPessoa.cod_Turma.label" default="Cod Turma" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="cod_Turma-label"><g:textField readonly="readonly" name="${turmaPessoaInstance}" value="${turmaPessoaInstance.cod_Turma}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${turmaPessoaInstance?.cod_Pessoa}">
                        <div class="rowElem"><label><span id="cod_Pessoa-label" class="property-label"><g:message code="turmaPessoa.cod_Pessoa.label" default="Cod Pessoa" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="cod_Pessoa-label"><g:textField readonly="readonly" name="${turmaPessoaInstance}" value="${turmaPessoaInstance.cod_Pessoa}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${turmaPessoaInstance?.curso}">
                        <div class="rowElem"><label><span id="curso-label" class="property-label"><g:message code="turmaPessoa.curso.label" default="Curso" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="curso-label"><g:link controller="curso" action="show" id="${turmaPessoaInstance?.curso?.id}">${turmaPessoaInstance?.curso?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${turmaPessoaInstance?.disciplinas}">
                        <div class="rowElem"><label><span id="disciplinas-label" class="property-label"><g:message code="turmaPessoa.disciplinas.label" default="Disciplinas" /></span>:</label>
                            <div class="formRight">
                                

                                <g:each in="${turmaPessoaInstance.disciplinas}" var="d">
                                    <span class="property-value" aria-labelledby="disciplinas-label"><g:link controller="periodoDisciplina" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span> <div class="fix"></div>
                                </g:each>
                                
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
