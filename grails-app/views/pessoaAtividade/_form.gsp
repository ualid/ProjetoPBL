<%@ page import="sisap.PessoaAtividade" %>



<div class="rowElem"><label for="atividade">
    <g:message code="pessoaAtividade.atividade.label" default="Atividade" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaAtividadeInstance, field: 'atividade', 'error')} required">

        <g:select id="atividade" name="atividade.id" from="${sisap.Atividade.list()}" optionKey="id" required="" value="${pessoaAtividadeInstance?.atividade?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="considerecao">
    <g:message code="pessoaAtividade.considerecao.label" default="Considerecao" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaAtividadeInstance, field: 'considerecao', 'error')} ">

        <g:textField name="considerecao" value="${pessoaAtividadeInstance?.considerecao}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="data_fim">
    <g:message code="pessoaAtividade.data_fim.label" default="Datafim" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaAtividadeInstance, field: 'data_fim', 'error')} required">

        <g:datePicker name="data_fim" precision="day"  value="${pessoaAtividadeInstance?.data_fim}"  />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="data_inicio">
    <g:message code="pessoaAtividade.data_inicio.label" default="Datainicio" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaAtividadeInstance, field: 'data_inicio', 'error')} required">

        <g:datePicker name="data_inicio" precision="day"  value="${pessoaAtividadeInstance?.data_inicio}"  />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="estado">
    <g:message code="pessoaAtividade.estado.label" default="Estado" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaAtividadeInstance, field: 'estado', 'error')} required">

        <g:field name="estado" type="number" value="${pessoaAtividadeInstance.estado}" required=""/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="nota">
    <g:message code="pessoaAtividade.nota.label" default="Nota" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaAtividadeInstance, field: 'nota', 'error')} required">

        <g:field name="nota" value="${fieldValue(bean: pessoaAtividadeInstance, field: 'nota')}" required=""/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="pessoa">
    <g:message code="pessoaAtividade.pessoa.label" default="Pessoa" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaAtividadeInstance, field: 'pessoa', 'error')} required">

        <g:select id="pessoa" name="pessoa.id" from="${sisap.Pessoa.list()}" optionKey="id" required="" value="${pessoaAtividadeInstance?.pessoa?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="qtd_horas">
    <g:message code="pessoaAtividade.qtd_horas.label" default="Qtdhoras" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaAtividadeInstance, field: 'qtd_horas', 'error')} required">

        <g:field name="qtd_horas" type="number" value="${pessoaAtividadeInstance.qtd_horas}" required=""/>
    </div>
</div><div class="fix"></div></div>


