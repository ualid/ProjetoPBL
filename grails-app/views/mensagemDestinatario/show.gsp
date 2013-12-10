
<%@ page import="sisap.MensagemDestinatario" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'mensagemDestinatario.label', default: 'MensagemDestinatario')}" />
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
                    <li><g:link action="show" id="${mensagemDestinatarioInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${mensagemDestinatarioInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${mensagemDestinatarioInstance}" var="error">
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
                <g:hiddenField name="id" value="${mensagemDestinatarioInstance.id}" />
                <ul>
                    <li class="iEdit"><g:link id="${mensagemDestinatarioInstance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
                    <li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'mensagemDestinatario.label', default: 'MensagemDestinatario')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados do teste</h5></div>
                    
                    <g:if test="${mensagemDestinatarioInstance?.destinatario}">
                        <div class="rowElem"><label><span id="destinatario-label" class="property-label"><g:message code="mensagemDestinatario.destinatario.label" default="Destinatario" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="destinatario-label"><g:link controller="pessoa" action="show" id="${mensagemDestinatarioInstance?.destinatario?.id}">${mensagemDestinatarioInstance?.destinatario?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${mensagemDestinatarioInstance?.lida}">
                        <div class="rowElem"><label><span id="lida-label" class="property-label"><g:message code="mensagemDestinatario.lida.label" default="Lida" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="lida-label"><g:formatBoolean boolean="${mensagemDestinatarioInstance?.lida}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${mensagemDestinatarioInstance?.mensagem}">
                        <div class="rowElem"><label><span id="mensagem-label" class="property-label"><g:message code="mensagemDestinatario.mensagem.label" default="Mensagem" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="mensagem-label"><g:link controller="mensagem" action="show" id="${mensagemDestinatarioInstance?.mensagem?.id}">${mensagemDestinatarioInstance?.mensagem?.encodeAsHTML()}</g:link></span>
                                
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
