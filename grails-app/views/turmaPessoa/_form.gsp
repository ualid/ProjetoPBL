<%@ page import="sisap.TurmaPessoa" %>



<div class="rowElem"><label for="cod_Turma">
    <g:message code="turmaPessoa.cod_Turma.label" default="Cod Turma" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaPessoaInstance, field: 'cod_Turma', 'error')} required">

        <g:field name="cod_Turma" type="number" value="${turmaPessoaInstance.cod_Turma}" required=""/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="cod_Pessoa">
    <g:message code="turmaPessoa.cod_Pessoa.label" default="Cod Pessoa" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaPessoaInstance, field: 'cod_Pessoa', 'error')} required">

        <g:field name="cod_Pessoa" type="number" value="${turmaPessoaInstance.cod_Pessoa}" required=""/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="curso">
    <g:message code="turmaPessoa.curso.label" default="Curso" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaPessoaInstance, field: 'curso', 'error')} required">

        <g:select id="curso" name="curso.id" from="${sisap.Curso.list()}" optionKey="id" required="" value="${turmaPessoaInstance?.curso?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="disciplinas">
    <g:message code="turmaPessoa.disciplinas.label" default="Disciplinas" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: turmaPessoaInstance, field: 'disciplinas', 'error')} ">

        <g:select name="disciplinas" from="${sisap.PeriodoDisciplina.list()}" multiple="multiple" optionKey="id" size="5" value="${turmaPessoaInstance?.disciplinas*.id}" class="many-to-many"/>
    </div>
</div><div class="fix"></div></div>


