<%@ page import="sisap.Disciplina" %>



<div class="rowElem"><label for="codigo">
    <g:message code="disciplina.codigo.label" default="Codigo" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'codigo', 'error')} required">

        <g:textField name="codigo" required="" value="${disciplinaInstance?.codigo}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="nome">
    <g:message code="disciplina.nome.label" default="Nome" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'nome', 'error')} required">

        <g:textField name="nome" required="" value="${disciplinaInstance?.nome}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="descricao">
    <g:message code="disciplina.descricao.label" default="Descricao" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'descricao', 'error')} ">

        <g:textArea name="descricao" cols="40" rows="5" maxlength="500" value="${disciplinaInstance?.descricao}"/>
    </div>
</div><div class="fix"></div></div>


