<div class="leftNav">
    <ul id="menu">


        <g:if test="${br.edu.unime.util.Perfil.getPerfilByKey(session.perfilId) == 'Coordenador'}">
            <li class="widgets"><a href="#" title="" class="exp"><span>Coordenação</span></a>
                <ul class="sub">
                     <li><g:link controller="atividade2" action="index" title="">Atividade</g:link> </li>
                      <li><g:link controller="tipoAtividade" action="index" title="">Tipo de atividade</g:link> </li>
                    <li><g:link controller="pessoa" action="index" title="">Usuários</g:link> </li>
                    <li><g:link controller="telefone" action="index" title="">Telefones</g:link> </li>
                    <li><g:link controller="disciplina" action="index" title="">Disciplinas</g:link> </li>
                    <li><g:link controller="curso" action="index" title="">Cursos</g:link> </li>
                    <li><g:link controller="turma" action="index" title="">Turmas</g:link> </li>
                   <li><g:link controller="turmaDisciplina" action="index" title="">Turma Disciplina</g:link> </li>
                   <li><g:link controller="pessoaAtividade" action="index" title="">Pessoa Atividade</g:link> </li>

                </ul>
            </li>
        </g:if>

        <g:if test="${br.edu.unime.util.Perfil.getPerfilByKey(session.perfilId) in ['Coordenador', 'Professor']}">
            <li class="widgets"><a href="#" title="" class="exp"><span>Docentes</span></a>
                <ul class="sub">
                    <li><g:link controller="periodoDisciplina" action="index" title="">Disciplina por período</g:link> </li>
                </ul>
            </li>
        </g:if>


        <li class="widgets"><a href="#" title="" class="exp"><span>Discentes</span></a>
            <ul class="sub">
                <li><g:link controller="periodoDisciplina" action="index" title="">Disciplina por período</g:link> </li>
            </ul>
        </li>

    </ul>
</div>