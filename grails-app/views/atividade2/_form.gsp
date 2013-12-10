<%@ page import="sisap.Atividade2" %>



<div class="rowElem"><label for="descricao">
    <g:message code="atividade2.descricao.label" default="Descricao" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividade2Instance, field: 'descricao', 'error')} required">

        <g:textField name="descricao" required="" value="${atividade2Instance?.descricao}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="nome">
    <g:message code="atividade2.nome.label" default="Nome" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividade2Instance, field: 'nome', 'error')} required">

        <g:textField name="nome" required="" value="${atividade2Instance?.nome}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="data_inicio">
    <g:message code="atividade2.data_inicio.label" default="Datainicio" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividade2Instance, field: 'data_inicio', 'error')} required">

        <g:datePicker name="data_inicio" precision="day"  value="${atividade2Instance?.data_inicio}"  />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="atividade">
    <g:message code="atividade2.atividade.label" default="Atividade" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividade2Instance, field: 'atividade', 'error')} ">

        <g:select id="atividade" name="atividade.id" from="${sisap.Atividade.list()}" optionKey="id" value="${atividade2Instance?.atividade?.id}" class="many-to-one" noSelection="['': 'Selecione']"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="quantidade_horas">
    <g:message code="atividade2.quantidade_horas.label" default="Quantidadehoras" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividade2Instance, field: 'quantidade_horas', 'error')} ">

        <g:field name="quantidade_horas" type="number" value="${atividade2Instance.quantidade_horas}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="ativo">
    <g:message code="atividade2.ativo.label" default="Ativo" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividade2Instance, field: 'ativo', 'error')} required">

        <g:field name="ativo" type="number" value="${atividade2Instance.ativo}" required=""/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="data_fim">
    <g:message code="atividade2.data_fim.label" default="Datafim" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividade2Instance, field: 'data_fim', 'error')} required">

        <g:datePicker name="data_fim" precision="day"  value="${atividade2Instance?.data_fim}"  />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="disciplina">
    <g:message code="atividade2.disciplina.label" default="Disciplina" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividade2Instance, field: 'disciplina', 'error')} required">

        <g:select id="disciplina" name="disciplina.id" from="${sisap.Disciplina.list()}" optionKey="id" required="" value="${atividade2Instance?.disciplina?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="tipoAtividade2">
    <g:message code="atividade2.tipoAtividade2.label" default="Tipo Atividade2" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividade2Instance, field: 'tipoAtividade2', 'error')} required">

        <g:select id="tipoAtividade2" name="tipoAtividade2.id" from="${sisap.TipoAtividade.list()}" optionKey="id" required="" value="${atividade2Instance?.tipoAtividade2?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


