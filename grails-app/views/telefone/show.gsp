
<%@ page import="sisap.Telefone" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'telefone.label', default: 'Telefone')}" />
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
                    <li><g:link action="show" id="${telefoneInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${telefoneInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${telefoneInstance}" var="error">
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
                <g:hiddenField name="id" value="${telefoneInstance.id}" />
                <ul>
                    <li class="iEdit"><g:link id="${telefoneInstance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
                    <li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'telefone.label', default: 'Telefone')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados do teste</h5></div>
                    
                    <g:if test="${telefoneInstance?.num_telefone}">
                        <div class="rowElem"><label><span id="num_telefone-label" class="property-label"><g:message code="telefone.num_telefone.label" default="Numtelefone" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="num_telefone-label"><g:textField readonly="readonly" name="${telefoneInstance}" value="${telefoneInstance.num_telefone}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${telefoneInstance?.ddd}">
                        <div class="rowElem"><label><span id="ddd-label" class="property-label"><g:message code="telefone.ddd.label" default="Ddd" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="ddd-label"><g:textField readonly="readonly" name="${telefoneInstance}" value="${telefoneInstance.ddd}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${telefoneInstance?.pessoa}">
                        <div class="rowElem"><label><span id="pessoa-label" class="property-label"><g:message code="telefone.pessoa.label" default="Pessoa" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="pessoa-label"><g:link controller="pessoa" action="show" id="${telefoneInstance?.pessoa?.id}">${telefoneInstance?.pessoa?.encodeAsHTML()}</g:link></span>
                                
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
