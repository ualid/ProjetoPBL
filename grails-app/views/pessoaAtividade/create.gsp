<%@ page import="sisap.PessoaAtividade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pessoaAtividade.label', default: 'PessoaAtividade')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="wrapper">
    <div class="content" id="container">
            <div class="title"><h5>Cadastrar ${message(code: 'pessoaAtividade.label', default: 'PessoaAtividade')}</h5></div>
        <div class="breadCrumbHolder module">
            <div class="breadCrumb module">
                <ul>
                    <li class="firstB"><a href="#">Home</a> </li>
                    <li><g:link action="index"> <g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link action="create"> <g:message code="default.create.label" args="[entityName]" /></g:link></li>
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
			<g:form action="save"  class="mainForm">

            <fieldset class="form">
                <div class="widget first">
                    <div class="head"><h5 class="iList">Preencha os campos abaixo</h5></div>
                    <g:render template="form"/>
                    <g:submitButton name="create" class="greyishBtn submitForm" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    <div class="fix"></div>
                </div>
					</fieldset>


			</g:form>
        </div>
        <div class="fix"></div>
		</div>
	</body>
</html>
