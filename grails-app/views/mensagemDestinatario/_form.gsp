<%@ page import="sisap.MensagemDestinatario" %>



<div class="rowElem"><label for="destinatario">
    <g:message code="mensagemDestinatario.destinatario.label" default="Destinatario" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemDestinatarioInstance, field: 'destinatario', 'error')} required">

        <g:select id="destinatario" name="destinatario.id" from="${sisap.Pessoa.list()}" optionKey="id" required="" value="${mensagemDestinatarioInstance?.destinatario?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="lida">
    <g:message code="mensagemDestinatario.lida.label" default="Lida" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemDestinatarioInstance, field: 'lida', 'error')} ">

        <g:checkBox name="lida" value="${mensagemDestinatarioInstance?.lida}" />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="mensagem">
    <g:message code="mensagemDestinatario.mensagem.label" default="Mensagem" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemDestinatarioInstance, field: 'mensagem', 'error')} required">

        <g:select id="mensagem" name="mensagem.id" from="${sisap.Mensagem.list()}" optionKey="id" required="" value="${mensagemDestinatarioInstance?.mensagem?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


