
<%@ page import="sisap.Pessoa" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
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
                    <li><g:link action="show" id="${pessoaInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${pessoaInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${pessoaInstance}" var="error">
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
                <g:hiddenField name="id" value="${pessoaInstance.id}" />
                <ul>
                    <li class="iEdit"><g:link id="${pessoaInstance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
                    <li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'pessoa.label', default: 'Pessoa')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados do teste</h5></div>
                    
                    <g:if test="${pessoaInstance?.nome}">
                        <div class="rowElem"><label><span id="nome-label" class="property-label"><g:message code="pessoa.nome.label" default="Nome" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="nome-label"><g:textField readonly="readonly" name="${pessoaInstance}" value="${pessoaInstance.nome}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaInstance?.matricula}">
                        <div class="rowElem"><label><span id="matricula-label" class="property-label"><g:message code="pessoa.matricula.label" default="Matricula" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="matricula-label"><g:textField readonly="readonly" name="${pessoaInstance}" value="${pessoaInstance.matricula}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaInstance?.email}">
                        <div class="rowElem"><label><span id="email-label" class="property-label"><g:message code="pessoa.email.label" default="Email" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="email-label"><g:textField readonly="readonly" name="${pessoaInstance}" value="${pessoaInstance.email}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaInstance?.cpf}">
                        <div class="rowElem"><label><span id="cpf-label" class="property-label"><g:message code="pessoa.cpf.label" default="Cpf" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="cpf-label"><g:textField readonly="readonly" name="${pessoaInstance}" value="${pessoaInstance.cpf}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaInstance?.senha}">
                        <div class="rowElem"><label><span id="senha-label" class="property-label"><g:message code="pessoa.senha.label" default="Senha" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="senha-label"><g:textField readonly="readonly" name="${pessoaInstance}" value="${pessoaInstance.senha}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaInstance?.perfilId}">
                        <div class="rowElem"><label><span id="perfilId-label" class="property-label"><g:message code="pessoa.perfilId.label" default="Perfil Id" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="perfilId-label"><g:textField readonly="readonly" name="${pessoaInstance}" value="${pessoaInstance.perfilId}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaInstance?.status}">
                        <div class="rowElem"><label><span id="status-label" class="property-label"><g:message code="pessoa.status.label" default="Status" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="status-label"><g:formatBoolean boolean="${pessoaInstance?.status}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaInstance?.curso}">
                        <div class="rowElem"><label><span id="curso-label" class="property-label"><g:message code="pessoa.curso.label" default="Curso" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="curso-label"><g:link controller="curso" action="show" id="${pessoaInstance?.curso?.id}">${pessoaInstance?.curso?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaInstance?.disciplinas}">
                        <div class="rowElem"><label><span id="disciplinas-label" class="property-label"><g:message code="pessoa.disciplinas.label" default="Disciplinas" /></span>:</label>
                            <div class="formRight">
                                

                                <g:each in="${pessoaInstance.disciplinas}" var="d">
                                    <span class="property-value" aria-labelledby="disciplinas-label"><g:link controller="periodoDisciplina" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span> <div class="fix"></div>
                                </g:each>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaInstance?.rg}">
                        <div class="rowElem"><label><span id="rg-label" class="property-label"><g:message code="pessoa.rg.label" default="Rg" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="rg-label"><g:textField readonly="readonly" name="${pessoaInstance}" value="${pessoaInstance.rg}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${pessoaInstance?.telefoneCelular}">
                        <div class="rowElem"><label><span id="telefoneCelular-label" class="property-label"><g:message code="pessoa.telefoneCelular.label" default="Telefone Celular" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="telefoneCelular-label"><g:textField readonly="readonly" name="${pessoaInstance}" value="${pessoaInstance.telefoneCelular}" /></span>
                                
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
