
<%@ page import="sisap.Atividade2" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'atividade2.label', default: 'Atividade2')}" />
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
                    <li><g:link action="show" id="${atividade2Instance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${atividade2Instance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${atividade2Instance}" var="error">
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
                <g:hiddenField name="id" value="${atividade2Instance.id}" />
                <ul>
                    <li class="iEdit"><g:link id="${atividade2Instance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
                    <li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'atividade2.label', default: 'Atividade2')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados do teste</h5></div>
                    
                    <g:if test="${atividade2Instance?.descricao}">
                        <div class="rowElem"><label><span id="descricao-label" class="property-label"><g:message code="atividade2.descricao.label" default="Descricao" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="descricao-label"><g:textField readonly="readonly" name="${atividade2Instance}" value="${atividade2Instance.descricao}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividade2Instance?.nome}">
                        <div class="rowElem"><label><span id="nome-label" class="property-label"><g:message code="atividade2.nome.label" default="Nome" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="nome-label"><g:textField readonly="readonly" name="${atividade2Instance}" value="${atividade2Instance.nome}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividade2Instance?.data_inicio}">
                        <div class="rowElem"><label><span id="data_inicio-label" class="property-label"><g:message code="atividade2.data_inicio.label" default="Datainicio" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="data_inicio-label"><g:formatDate date="${atividade2Instance?.data_inicio}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividade2Instance?.atividade}">
                        <div class="rowElem"><label><span id="atividade-label" class="property-label"><g:message code="atividade2.atividade.label" default="Atividade" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="atividade-label"><g:link controller="atividade" action="show" id="${atividade2Instance?.atividade?.id}">${atividade2Instance?.atividade?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividade2Instance?.quantidade_horas}">
                        <div class="rowElem"><label><span id="quantidade_horas-label" class="property-label"><g:message code="atividade2.quantidade_horas.label" default="Quantidadehoras" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="quantidade_horas-label"><g:textField readonly="readonly" name="${atividade2Instance}" value="${atividade2Instance.quantidade_horas}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividade2Instance?.ativo}">
                        <div class="rowElem"><label><span id="ativo-label" class="property-label"><g:message code="atividade2.ativo.label" default="Ativo" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="ativo-label"><g:textField readonly="readonly" name="${atividade2Instance}" value="${atividade2Instance.ativo}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividade2Instance?.data_fim}">
                        <div class="rowElem"><label><span id="data_fim-label" class="property-label"><g:message code="atividade2.data_fim.label" default="Datafim" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="data_fim-label"><g:formatDate date="${atividade2Instance?.data_fim}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividade2Instance?.disciplina}">
                        <div class="rowElem"><label><span id="disciplina-label" class="property-label"><g:message code="atividade2.disciplina.label" default="Disciplina" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="disciplina-label"><g:link controller="disciplina" action="show" id="${atividade2Instance?.disciplina?.id}">${atividade2Instance?.disciplina?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividade2Instance?.tipoAtividade2}">
                        <div class="rowElem"><label><span id="tipoAtividade2-label" class="property-label"><g:message code="atividade2.tipoAtividade2.label" default="Tipo Atividade2" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="tipoAtividade2-label"><g:link controller="tipoAtividade" action="show" id="${atividade2Instance?.tipoAtividade2?.id}">${atividade2Instance?.tipoAtividade2?.encodeAsHTML()}</g:link></span>
                                
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
