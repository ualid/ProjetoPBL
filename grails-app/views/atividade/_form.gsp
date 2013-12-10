<%@ page import="sisap.Atividade" %>



<div class="rowElem"><label for="descricao">
    <g:message code="atividade.descricao.label" default="Descricao" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'descricao', 'error')} required">

        <g:textField name="descricao" required="" value="${atividadeInstance?.descricao}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="nome">
    <g:message code="atividade.nome.label" default="Nome" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'nome', 'error')} required">

        <g:textField name="nome" required="" value="${atividadeInstance?.nome}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="data_inicio">
    <g:message code="atividade.data_inicio.label" default="Datainicio" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'data_inicio', 'error')} required">

        <g:datePicker name="data_inicio" precision="day"  value="${atividadeInstance?.data_inicio}"  />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="atividade">
    <g:message code="atividade.atividade.label" default="Atividade" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'atividade', 'error')} ">

        <g:select id="atividade" name="atividade.id" from="${sisap.Atividade.list()}" optionKey="id" value="${atividadeInstance?.atividade?.id}" class="many-to-one" noSelection="['': 'Selecione']"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="quantidade_horas">
    <g:message code="atividade.quantidade_horas.label" default="Quantidadehoras" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'quantidade_horas', 'error')} ">

        <g:field name="quantidade_horas" type="number" value="${atividadeInstance.quantidade_horas}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="ativo">
    <g:message code="atividade.ativo.label" default="Ativo" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'ativo', 'error')} required">

        <g:field name="ativo" type="number" value="${atividadeInstance.ativo}" required=""/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="data_fim">
    <g:message code="atividade.data_fim.label" default="Datafim" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'data_fim', 'error')} required">

        <g:datePicker name="data_fim" precision="day"  value="${atividadeInstance?.data_fim}"  />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="disciplina">
    <g:message code="atividade.disciplina.label" default="Disciplina" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'disciplina', 'error')} required">

        <g:select id="disciplina" name="disciplina.id" from="${sisap.Disciplina.list()}" optionKey="id" required="" value="${atividadeInstance?.disciplina?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="tipoAtividade2">
    <g:message code="atividade.tipoAtividade2.label" default="Tipo Atividade2" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'tipoAtividade2', 'error')} required">

        <g:select id="tipoAtividade2" name="tipoAtividade2.id" from="${sisap.TipoAtividade.list()}" optionKey="id" required="" value="${atividadeInstance?.tipoAtividade2?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


