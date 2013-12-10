
<%@ page import="sisap.Mensagem" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
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
                    <li><g:link action="show" id="${mensagemInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${mensagemInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${mensagemInstance}" var="error">
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
                <g:hiddenField name="id" value="${mensagemInstance.id}" />
                <ul>
                    <li class="iEdit"><g:link id="${mensagemInstance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
                    <li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'mensagem.label', default: 'Mensagem')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados do teste</h5></div>
                    
                    <g:if test="${mensagemInstance?.titulo}">
                        <div class="rowElem"><label><span id="titulo-label" class="property-label"><g:message code="mensagem.titulo.label" default="Titulo" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="titulo-label"><g:textField readonly="readonly" name="${mensagemInstance}" value="${mensagemInstance.titulo}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${mensagemInstance?.destinatarios}">
                        <div class="rowElem"><label><span id="destinatarios-label" class="property-label"><g:message code="mensagem.destinatarios.label" default="Destinatarios" /></span>:</label>
                            <div class="formRight">
                                

                                <g:each in="${mensagemInstance.destinatarios}" var="d">
                                    <span class="property-value" aria-labelledby="destinatarios-label"><g:link controller="pessoa" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span> <div class="fix"></div>
                                </g:each>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${mensagemInstance?.mensagem}">
                        <div class="rowElem"><label><span id="mensagem-label" class="property-label"><g:message code="mensagem.mensagem.label" default="Mensagem" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="mensagem-label"><g:textField readonly="readonly" name="${mensagemInstance}" value="${mensagemInstance.mensagem}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${mensagemInstance?.dataMensagem}">
                        <div class="rowElem"><label><span id="dataMensagem-label" class="property-label"><g:message code="mensagem.dataMensagem.label" default="Data Mensagem" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="dataMensagem-label"><g:formatDate date="${mensagemInstance?.dataMensagem}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${mensagemInstance?.emailDestinatario}">
                        <div class="rowElem"><label><span id="emailDestinatario-label" class="property-label"><g:message code="mensagem.emailDestinatario.label" default="Email Destinatario" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="emailDestinatario-label"><g:textField readonly="readonly" name="${mensagemInstance}" value="${mensagemInstance.emailDestinatario}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${mensagemInstance?.mensagens}">
                        <div class="rowElem"><label><span id="mensagens-label" class="property-label"><g:message code="mensagem.mensagens.label" default="Mensagens" /></span>:</label>
                            <div class="formRight">
                                

                                <g:each in="${mensagemInstance.mensagens}" var="m">
                                    <span class="property-value" aria-labelledby="mensagens-label"><g:link controller="mensagem" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span> <div class="fix"></div>
                                </g:each>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${mensagemInstance?.remetente}">
                        <div class="rowElem"><label><span id="remetente-label" class="property-label"><g:message code="mensagem.remetente.label" default="Remetente" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="remetente-label"><g:link controller="pessoa" action="show" id="${mensagemInstance?.remetente?.id}">${mensagemInstance?.remetente?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${mensagemInstance?.status}">
                        <div class="rowElem"><label><span id="status-label" class="property-label"><g:message code="mensagem.status.label" default="Status" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="status-label"><g:formatBoolean boolean="${mensagemInstance?.status}" /></span>
                                
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
