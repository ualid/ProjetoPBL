<%@ page import="sisap.Pessoa" %>



<div class="rowElem"><label for="nome">
    <g:message code="pessoa.nome.label" default="Nome" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} required">

        <g:textField name="nome" required="" value="${pessoaInstance?.nome}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="matricula">
    <g:message code="pessoa.matricula.label" default="Matricula" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'matricula', 'error')} required">

        <g:textField name="matricula" required="" value="${pessoaInstance?.matricula}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="email">
    <g:message code="pessoa.email.label" default="Email" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'email', 'error')} required">

        <g:field type="email" name="email" required="" value="${pessoaInstance?.email}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="cpf">
    <g:message code="pessoa.cpf.label" default="Cpf" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'cpf', 'error')} ">

        <g:textField name="cpf" value="${pessoaInstance?.cpf}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="senha">
    <g:message code="pessoa.senha.label" default="Senha" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'senha', 'error')} required">

        <g:textField name="senha" required="" value="${pessoaInstance?.senha}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="perfilId">
    <g:message code="pessoa.perfilId.label" default="Perfil Id" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'perfilId', 'error')} required">

        <g:select name="perfilId" from="${pessoaInstance.constraints.perfilId.inList}" required="" value="${fieldValue(bean: pessoaInstance, field: 'perfilId')}" valueMessagePrefix="pessoa.perfilId"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="status">
    <g:message code="pessoa.status.label" default="Status" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'status', 'error')} ">

        <g:checkBox name="status" value="${pessoaInstance?.status}" />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="curso">
    <g:message code="pessoa.curso.label" default="Curso" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'curso', 'error')} ">

        <g:select id="curso" name="curso.id" from="${sisap.Curso.list()}" optionKey="id" value="${pessoaInstance?.curso?.id}" class="many-to-one" noSelection="['': 'Selecione']"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="disciplinas">
    <g:message code="pessoa.disciplinas.label" default="Disciplinas" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'disciplinas', 'error')} ">

        <g:select name="disciplinas" from="${sisap.PeriodoDisciplina.list()}" multiple="multiple" optionKey="id" size="5" value="${pessoaInstance?.disciplinas*.id}" class="many-to-many"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="rg">
    <g:message code="pessoa.rg.label" default="Rg" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'rg', 'error')} ">

        <g:textField name="rg" value="${pessoaInstance?.rg}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="telefoneCelular">
    <g:message code="pessoa.telefoneCelular.label" default="Telefone Celular" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'telefoneCelular', 'error')} ">

        <g:textField name="telefoneCelular" value="${pessoaInstance?.telefoneCelular}"/>
    </div>
</div><div class="fix"></div></div>


