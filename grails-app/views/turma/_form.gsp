<%@ page import="sisap.Turma" %>



<div class="rowElem"><label for="nome">
    <g:message code="turma.nome.label" default="Nome" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaInstance, field: 'nome', 'error')} required">

        <g:textField name="nome" required="" value="${turmaInstance?.nome}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="data_inicio">
    <g:message code="turma.data_inicio.label" default="Datainicio" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaInstance, field: 'data_inicio', 'error')} required">

        <g:datePicker name="data_inicio" precision="day"  value="${turmaInstance?.data_inicio}"  />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="data_fim">
    <g:message code="turma.data_fim.label" default="Datafim" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaInstance, field: 'data_fim', 'error')} ">

        <g:datePicker name="data_fim" precision="day"  value="${turmaInstance?.data_fim}" default="none" noSelection="['': '']" />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="descricao">
    <g:message code="turma.descricao.label" default="Descricao" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaInstance, field: 'descricao', 'error')} ">

        <g:textField name="descricao" value="${turmaInstance?.descricao}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="turmaDisciplina">
    <g:message code="turma.turmaDisciplina.label" default="Turma Disciplina" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaInstance, field: 'turmaDisciplina', 'error')} required">

        <g:select id="turmaDisciplina" name="turmaDisciplina.id" from="${sisap.TurmaDisciplina.list()}" optionKey="id" required="" value="${turmaInstance?.turmaDisciplina?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


