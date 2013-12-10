<%@ page import="sisap.Curso" %>



<div class="rowElem"><label for="codigo">
    <g:message code="curso.codigo.label" default="Codigo" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'codigo', 'error')} required">

        <g:textField name="codigo" required="" value="${cursoInstance?.codigo}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="nome">
    <g:message code="curso.nome.label" default="Nome" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'nome', 'error')} required">

        <g:textField name="nome" required="" value="${cursoInstance?.nome}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="descricao">
    <g:message code="curso.descricao.label" default="Descricao" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'descricao', 'error')} required">

        <g:textField name="descricao" required="" value="${cursoInstance?.descricao}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="alunos">
    <g:message code="curso.alunos.label" default="Alunos" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'alunos', 'error')} ">

        
<ul class="one-to-many">
<g:each in="${cursoInstance?.alunos?}" var="a">
    <li><g:link controller="pessoa" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pessoa" action="create" params="['curso.id': cursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pessoa.label', default: 'Pessoa')])}</g:link>
</li>
</ul>

    </div>
</div><div class="fix"></div></div>


