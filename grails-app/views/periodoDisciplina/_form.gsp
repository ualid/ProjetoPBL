<%@ page import="sisap.PeriodoDisciplina" %>



<div class="rowElem"><label for="alunos">
    <g:message code="periodoDisciplina.alunos.label" default="Alunos" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'alunos', 'error')} ">

        
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="ano">
    <g:message code="periodoDisciplina.ano.label" default="Ano" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'ano', 'error')} required">

        <g:field name="ano" type="number" value="${periodoDisciplinaInstance.ano}" required=""/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="atividadesPeriodo">
    <g:message code="periodoDisciplina.atividadesPeriodo.label" default="Atividades Periodo" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'atividadesPeriodo', 'error')} ">

        
<ul class="one-to-many">
<g:each in="${periodoDisciplinaInstance?.atividadesPeriodo?}" var="a">
    <li><g:link controller="atividadePeriodo" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="atividadePeriodo" action="create" params="['periodoDisciplina.id': periodoDisciplinaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo')])}</g:link>
</li>
</ul>

    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="disciplina">
    <g:message code="periodoDisciplina.disciplina.label" default="Disciplina" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'disciplina', 'error')} required">

        <g:select id="disciplina" name="disciplina.id" from="${sisap.Disciplina.list()}" optionKey="id" required="" value="${periodoDisciplinaInstance?.disciplina?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="grupos">
    <g:message code="periodoDisciplina.grupos.label" default="Grupos" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'grupos', 'error')} ">

        <g:select name="grupos" from="${sisap.Grupo.list()}" multiple="multiple" optionKey="id" size="5" value="${periodoDisciplinaInstance?.grupos*.id}" class="many-to-many"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="professor">
    <g:message code="periodoDisciplina.professor.label" default="Professor" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'professor', 'error')} required">

        <g:select id="professor" name="professor.id" from="${sisap.Pessoa.list()}" optionKey="id" required="" value="${periodoDisciplinaInstance?.professor?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="sala">
    <g:message code="periodoDisciplina.sala.label" default="Sala" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'sala', 'error')} required">

        <g:field name="sala" type="number" value="${periodoDisciplinaInstance.sala}" required=""/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="semestre">
    <g:message code="periodoDisciplina.semestre.label" default="Semestre" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'semestre', 'error')} required">

        <g:field name="semestre" type="number" value="${periodoDisciplinaInstance.semestre}" required=""/>
    </div>
</div><div class="fix"></div></div>


