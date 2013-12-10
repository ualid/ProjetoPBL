
<%@ page import="sisap.PessoaAtividade" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'pessoaAtividade.label', default: 'PessoaAtividade')}" />
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
                    <li><g:link action="show" id="${pessoaAtividadeInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${pessoaAtividadeInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${pessoaAtividadeInstance}" var="error">
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
                <g:hiddenField name="id" value="${pessoaAtividadeInstance.id}" />
                <ul>
                    <li class="iEdit"><g:link id="${pessoaAtividadeInstance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
                    <li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'pessoaAtividade.label', default: 'PessoaAtividade')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados do teste</h5></div>
                    
                    <g:if test="${pessoaAtividadeInstance?.atividade}">
                        <div class="rowElem"><label><span id="atividade-label" class="property-label"><g:message code="pessoaAtividade.atividade.label" default="Atividade" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="atividade-label"><g:link controller="atividade" action="show" id="${pessoaAtividadeInstance?.atividade?.id}">${pessoaAtividadeInstance?.atividade?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaAtividadeInstance?.considerecao}">
                        <div class="rowElem"><label><span id="considerecao-label" class="property-label"><g:message code="pessoaAtividade.considerecao.label" default="Considerecao" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="considerecao-label"><g:textField readonly="readonly" name="${pessoaAtividadeInstance}" value="${pessoaAtividadeInstance.considerecao}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaAtividadeInstance?.data_fim}">
                        <div class="rowElem"><label><span id="data_fim-label" class="property-label"><g:message code="pessoaAtividade.data_fim.label" default="Datafim" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="data_fim-label"><g:formatDate date="${pessoaAtividadeInstance?.data_fim}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaAtividadeInstance?.data_inicio}">
                        <div class="rowElem"><label><span id="data_inicio-label" class="property-label"><g:message code="pessoaAtividade.data_inicio.label" default="Datainicio" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="data_inicio-label"><g:formatDate date="${pessoaAtividadeInstance?.data_inicio}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaAtividadeInstance?.estado}">
                        <div class="rowElem"><label><span id="estado-label" class="property-label"><g:message code="pessoaAtividade.estado.label" default="Estado" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="estado-label"><g:textField readonly="readonly" name="${pessoaAtividadeInstance}" value="${pessoaAtividadeInstance.estado}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaAtividadeInstance?.nota}">
                        <div class="rowElem"><label><span id="nota-label" class="property-label"><g:message code="pessoaAtividade.nota.label" default="Nota" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="nota-label"><g:textField readonly="readonly" name="${pessoaAtividadeInstance}" value="${pessoaAtividadeInstance.nota}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaAtividadeInstance?.pessoa}">
                        <div class="rowElem"><label><span id="pessoa-label" class="property-label"><g:message code="pessoaAtividade.pessoa.label" default="Pessoa" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="pessoa-label"><g:link controller="pessoa" action="show" id="${pessoaAtividadeInstance?.pessoa?.id}">${pessoaAtividadeInstance?.pessoa?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaAtividadeInstance?.qtd_horas}">
                        <div class="rowElem"><label><span id="qtd_horas-label" class="property-label"><g:message code="pessoaAtividade.qtd_horas.label" default="Qtdhoras" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="qtd_horas-label"><g:textField readonly="readonly" name="${pessoaAtividadeInstance}" value="${pessoaAtividadeInstance.qtd_horas}" /></span>
                                
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
