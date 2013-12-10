package sisap



import org.junit.*
import grails.test.mixin.*

@TestFor(PessoaAtividadeController)
@Mock(PessoaAtividade)
class PessoaAtividadeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pessoaAtividade/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pessoaAtividadeInstanceList.size() == 0
        assert model.pessoaAtividadeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pessoaAtividadeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pessoaAtividadeInstance != null
        assert view == '/pessoaAtividade/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pessoaAtividade/show/1'
        assert controller.flash.message != null
        assert PessoaAtividade.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pessoaAtividade/list'

        populateValidParams(params)
        def pessoaAtividade = new PessoaAtividade(params)

        assert pessoaAtividade.save() != null

        params.id = pessoaAtividade.id

        def model = controller.show()

        assert model.pessoaAtividadeInstance == pessoaAtividade
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pessoaAtividade/list'

        populateValidParams(params)
        def pessoaAtividade = new PessoaAtividade(params)

        assert pessoaAtividade.save() != null

        params.id = pessoaAtividade.id

        def model = controller.edit()

        assert model.pessoaAtividadeInstance == pessoaAtividade
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pessoaAtividade/list'

        response.reset()

        populateValidParams(params)
        def pessoaAtividade = new PessoaAtividade(params)

        assert pessoaAtividade.save() != null

        // test invalid parameters in update
        params.id = pessoaAtividade.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pessoaAtividade/edit"
        assert model.pessoaAtividadeInstance != null

        pessoaAtividade.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pessoaAtividade/show/$pessoaAtividade.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pessoaAtividade.clearErrors()

        populateValidParams(params)
        params.id = pessoaAtividade.id
        params.version = -1
        controller.update()

        assert view == "/pessoaAtividade/edit"
        assert model.pessoaAtividadeInstance != null
        assert model.pessoaAtividadeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pessoaAtividade/list'

        response.reset()

        populateValidParams(params)
        def pessoaAtividade = new PessoaAtividade(params)

        assert pessoaAtividade.save() != null
        assert PessoaAtividade.count() == 1

        params.id = pessoaAtividade.id

        controller.delete()

        assert PessoaAtividade.count() == 0
        assert PessoaAtividade.get(pessoaAtividade.id) == null
        assert response.redirectedUrl == '/pessoaAtividade/list'
    }
}
