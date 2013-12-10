<%@ page import="sisap.TipoAtividade" %>



<div class="rowElem"><label for="nome">
    <g:message code="tipoAtividade.nome.label" default="Nome" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: tipoAtividadeInstance, field: 'nome', 'error')} required">

        <g:textField name="nome" required="" value="${tipoAtividadeInstance?.nome}"/>
    </div>
</div><div class="fix"></div></div>


