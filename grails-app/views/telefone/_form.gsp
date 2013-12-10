<%@ page import="sisap.Telefone" %>



<div class="rowElem"><label for="num_telefone">
    <g:message code="telefone.num_telefone.label" default="Numtelefone" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'num_telefone', 'error')} required">

        <g:textField name="num_telefone" required="" value="${telefoneInstance?.num_telefone}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="ddd">
    <g:message code="telefone.ddd.label" default="Ddd" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'ddd', 'error')} ">

        <g:textField name="ddd" value="${telefoneInstance?.ddd}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="pessoa">
    <g:message code="telefone.pessoa.label" default="Pessoa" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'pessoa', 'error')} required">

        <g:select id="pessoa" name="pessoa.id" from="${sisap.Pessoa.list()}" optionKey="id" required="" value="${telefoneInstance?.pessoa?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


