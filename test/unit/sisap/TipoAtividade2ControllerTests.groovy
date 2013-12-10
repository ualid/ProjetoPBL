package sisap



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoAtividade2Controller)
@Mock(TipoAtividade2)
class TipoAtividade2ControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoAtividade2/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoAtividade2InstanceList.size() == 0
        assert model.tipoAtividade2InstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoAtividade2Instance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoAtividade2Instance != null
        assert view == '/tipoAtividade2/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoAtividade2/show/1'
        assert controller.flash.message != null
        assert TipoAtividade2.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoAtividade2/list'

        populateValidParams(params)
        def tipoAtividade2 = new TipoAtividade2(params)

        assert tipoAtividade2.save() != null

        params.id = tipoAtividade2.id

        def model = controller.show()

        assert model.tipoAtividade2Instance == tipoAtividade2
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoAtividade2/list'

        populateValidParams(params)
        def tipoAtividade2 = new TipoAtividade2(params)

        assert tipoAtividade2.save() != null

        params.id = tipoAtividade2.id

        def model = controller.edit()

        assert model.tipoAtividade2Instance == tipoAtividade2
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoAtividade2/list'

        response.reset()

        populateValidParams(params)
        def tipoAtividade2 = new TipoAtividade2(params)

        assert tipoAtividade2.save() != null

        // test invalid parameters in update
        params.id = tipoAtividade2.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoAtividade2/edit"
        assert model.tipoAtividade2Instance != null

        tipoAtividade2.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoAtividade2/show/$tipoAtividade2.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoAtividade2.clearErrors()

        populateValidParams(params)
        params.id = tipoAtividade2.id
        params.version = -1
        controller.update()

        assert view == "/tipoAtividade2/edit"
        assert model.tipoAtividade2Instance != null
        assert model.tipoAtividade2Instance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoAtividade2/list'

        response.reset()

        populateValidParams(params)
        def tipoAtividade2 = new TipoAtividade2(params)

        assert tipoAtividade2.save() != null
        assert TipoAtividade2.count() == 1

        params.id = tipoAtividade2.id

        controller.delete()

        assert TipoAtividade2.count() == 0
        assert TipoAtividade2.get(tipoAtividade2.id) == null
        assert response.redirectedUrl == '/tipoAtividade2/list'
    }
}
