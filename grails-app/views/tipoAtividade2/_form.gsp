<%@ page import="sisap.TipoAtividade2" %>



<div class="rowElem"><label for="nome">
    <g:message code="tipoAtividade2.nome.label" default="Nome" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: tipoAtividade2Instance, field: 'nome', 'error')} required">

        <g:textField name="nome" required="" value="${tipoAtividade2Instance?.nome}"/>
    </div>
</div><div class="fix"></div></div>


