package sisap



import org.junit.*
import grails.test.mixin.*

@TestFor(TurmaPessoaController)
@Mock(TurmaPessoa)
class TurmaPessoaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/turmaPessoa/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.turmaPessoaInstanceList.size() == 0
        assert model.turmaPessoaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.turmaPessoaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.turmaPessoaInstance != null
        assert view == '/turmaPessoa/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/turmaPessoa/show/1'
        assert controller.flash.message != null
        assert TurmaPessoa.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/turmaPessoa/list'

        populateValidParams(params)
        def turmaPessoa = new TurmaPessoa(params)

        assert turmaPessoa.save() != null

        params.id = turmaPessoa.id

        def model = controller.show()

        assert model.turmaPessoaInstance == turmaPessoa
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/turmaPessoa/list'

        populateValidParams(params)
        def turmaPessoa = new TurmaPessoa(params)

        assert turmaPessoa.save() != null

        params.id = turmaPessoa.id

        def model = controller.edit()

        assert model.turmaPessoaInstance == turmaPessoa
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/turmaPessoa/list'

        response.reset()

        populateValidParams(params)
        def turmaPessoa = new TurmaPessoa(params)

        assert turmaPessoa.save() != null

        // test invalid parameters in update
        params.id = turmaPessoa.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/turmaPessoa/edit"
        assert model.turmaPessoaInstance != null

        turmaPessoa.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/turmaPessoa/show/$turmaPessoa.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        turmaPessoa.clearErrors()

        populateValidParams(params)
        params.id = turmaPessoa.id
        params.version = -1
        controller.update()

        assert view == "/turmaPessoa/edit"
        assert model.turmaPessoaInstance != null
        assert model.turmaPessoaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/turmaPessoa/list'

        response.reset()

        populateValidParams(params)
        def turmaPessoa = new TurmaPessoa(params)

        assert turmaPessoa.save() != null
        assert TurmaPessoa.count() == 1

        params.id = turmaPessoa.id

        controller.delete()

        assert TurmaPessoa.count() == 0
        assert TurmaPessoa.get(turmaPessoa.id) == null
        assert response.redirectedUrl == '/turmaPessoa/list'
    }
}
