<%@ page import="sisap.Mensagem" %>



<div class="rowElem"><label for="titulo">
    <g:message code="mensagem.titulo.label" default="Titulo" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'titulo', 'error')} required">

        <g:textField name="titulo" required="" value="${mensagemInstance?.titulo}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="destinatarios">
    <g:message code="mensagem.destinatarios.label" default="Destinatarios" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'destinatarios', 'error')} ">

        <g:select name="destinatarios" from="${sisap.Pessoa.list()}" multiple="multiple" optionKey="id" size="5" value="${mensagemInstance?.destinatarios*.id}" class="many-to-many"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="mensagem">
    <g:message code="mensagem.mensagem.label" default="Mensagem" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'mensagem', 'error')} ">

        <g:textArea name="mensagem" cols="40" rows="5" maxlength="300" value="${mensagemInstance?.mensagem}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="dataMensagem">
    <g:message code="mensagem.dataMensagem.label" default="Data Mensagem" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'dataMensagem', 'error')} required">

        <g:datePicker name="dataMensagem" precision="day"  value="${mensagemInstance?.dataMensagem}"  />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="emailDestinatario">
    <g:message code="mensagem.emailDestinatario.label" default="Email Destinatario" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'emailDestinatario', 'error')} ">

        <g:textField name="emailDestinatario" value="${mensagemInstance?.emailDestinatario}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="mensagens">
    <g:message code="mensagem.mensagens.label" default="Mensagens" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'mensagens', 'error')} ">

        <g:select name="mensagens" from="${sisap.Mensagem.list()}" multiple="multiple" optionKey="id" size="5" value="${mensagemInstance?.mensagens*.id}" class="many-to-many"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="remetente">
    <g:message code="mensagem.remetente.label" default="Remetente" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'remetente', 'error')} required">

        <g:select id="remetente" name="remetente.id" from="${sisap.Pessoa.list()}" optionKey="id" required="" value="${mensagemInstance?.remetente?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="status">
    <g:message code="mensagem.status.label" default="Status" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'status', 'error')} ">

        <g:checkBox name="status" value="${mensagemInstance?.status}" />
    </div>
</div><div class="fix"></div></div>


