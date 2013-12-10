<%@ page import="sisap.TurmaDisciplina" %>



<div class="rowElem"><label for="nome_turma">
    <g:message code="turmaDisciplina.nome_turma.label" default="Nometurma" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaDisciplinaInstance, field: 'nome_turma', 'error')} required">

        <g:textField name="nome_turma" required="" value="${turmaDisciplinaInstance?.nome_turma}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="nome_disciplina">
    <g:message code="turmaDisciplina.nome_disciplina.label" default="Nomedisciplina" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaDisciplinaInstance, field: 'nome_disciplina', 'error')} required">

        <g:textField name="nome_disciplina" required="" value="${turmaDisciplinaInstance?.nome_disciplina}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="data_fim">
    <g:message code="turmaDisciplina.data_fim.label" default="Datafim" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaDisciplinaInstance, field: 'data_fim', 'error')} required">

        <g:datePicker name="data_fim" precision="day"  value="${turmaDisciplinaInstance?.data_fim}"  />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="data_inicio">
    <g:message code="turmaDisciplina.data_inicio.label" default="Datainicio" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaDisciplinaInstance, field: 'data_inicio', 'error')} required">

        <g:datePicker name="data_inicio" precision="day"  value="${turmaDisciplinaInstance?.data_inicio}"  />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="disciplina">
    <g:message code="turmaDisciplina.disciplina.label" default="Disciplina" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaDisciplinaInstance, field: 'disciplina', 'error')} required">

        <g:select id="disciplina" name="disciplina.id" from="${sisap.Disciplina.list()}" optionKey="id" required="" value="${turmaDisciplinaInstance?.disciplina?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="periodo">
    <g:message code="turmaDisciplina.periodo.label" default="Periodo" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaDisciplinaInstance, field: 'periodo', 'error')} ">

        <g:textField name="periodo" value="${turmaDisciplinaInstance?.periodo}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="turma">
    <g:message code="turmaDisciplina.turma.label" default="Turma" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaDisciplinaInstance, field: 'turma', 'error')} required">

        <g:select id="turma" name="turma.id" from="${sisap.Turma.list()}" optionKey="id" required="" value="${turmaDisciplinaInstance?.turma?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


