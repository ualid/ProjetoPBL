package sisap



import org.junit.*
import grails.test.mixin.*

@TestFor(TelefoneController)
@Mock(Telefone)
class TelefoneControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/telefone/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.telefoneInstanceList.size() == 0
        assert model.telefoneInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.telefoneInstance != null
    }

    void testSave() {
        controller.save()

        assert model.telefoneInstance != null
        assert view == '/telefone/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/telefone/show/1'
        assert controller.flash.message != null
        assert Telefone.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/telefone/list'

        populateValidParams(params)
        def telefone = new Telefone(params)

        assert telefone.save() != null

        params.id = telefone.id

        def model = controller.show()

        assert model.telefoneInstance == telefone
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/telefone/list'

        populateValidParams(params)
        def telefone = new Telefone(params)

        assert telefone.save() != null

        params.id = telefone.id

        def model = controller.edit()

        assert model.telefoneInstance == telefone
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/telefone/list'

        response.reset()

        populateValidParams(params)
        def telefone = new Telefone(params)

        assert telefone.save() != null

        // test invalid parameters in update
        params.id = telefone.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/telefone/edit"
        assert model.telefoneInstance != null

        telefone.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/telefone/show/$telefone.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        telefone.clearErrors()

        populateValidParams(params)
        params.id = telefone.id
        params.version = -1
        controller.update()

        assert view == "/telefone/edit"
        assert model.telefoneInstance != null
        assert model.telefoneInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/telefone/list'

        response.reset()

        populateValidParams(params)
        def telefone = new Telefone(params)

        assert telefone.save() != null
        assert Telefone.count() == 1

        params.id = telefone.id

        controller.delete()

        assert Telefone.count() == 0
        assert Telefone.get(telefone.id) == null
        assert response.redirectedUrl == '/telefone/list'
    }
}
