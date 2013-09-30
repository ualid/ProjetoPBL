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

        <g:textField name="email" required="" value="${pessoaInstance?.email}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="cpf">
    <g:message code="pessoa.cpf.label" default="Cpf" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'cpf', 'error')} required">

        <g:textField name="cpf" required="" value="${pessoaInstance?.cpf}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="senha">
    <g:message code="pessoa.senha.label" default="Senha" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'senha', 'error')} required">

        <g:passwordField name="senha" required="" value="${pessoaInstance?.senha}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="perfilId">
    <g:message code="pessoa.perfilId.label" default="Perfil Id" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'perfilId', 'error')} required">
        <div class="formRight noSearch">
            <g:select class="chzn-select" name="perfilId" from="${br.edu.unime.util.Perfil.mapPerfil}" optionKey="key" optionValue="value" value="${fieldValue(bean: pessoaInstance, field: 'perfilId')}" valueMessagePrefix="pessoa.perfilId"/>
        </div>

    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="status">
    <g:message code="pessoa.status.label" default="Status" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'status', 'error')} ">

        <g:checkBox name="status" value="${pessoaInstance?.status}" />
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

                        <div class="rowElem">
                        <label>Curso:</label>
                        <div class="formRight searchDrop">
                        <g:select name="curso.id" noSelection="${[null:'Selecione um Curso']}" from="${sisap.Curso.listOrderByNome()}" optionKey="id" optionValue="nome" class="chzn-select" style="width:350px;" data-placeholder="Selecione um Curso..." />

                        </div>
                        <div class="fix"></div>
                        </div>


