package sisap



import org.junit.*
import grails.test.mixin.*

@TestFor(Atividade2Controller)
@Mock(Atividade2)
class Atividade2ControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/atividade2/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.atividade2InstanceList.size() == 0
        assert model.atividade2InstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.atividade2Instance != null
    }

    void testSave() {
        controller.save()

        assert model.atividade2Instance != null
        assert view == '/atividade2/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/atividade2/show/1'
        assert controller.flash.message != null
        assert Atividade2.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/atividade2/list'

        populateValidParams(params)
        def atividade2 = new Atividade2(params)

        assert atividade2.save() != null

        params.id = atividade2.id

        def model = controller.show()

        assert model.atividade2Instance == atividade2
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/atividade2/list'

        populateValidParams(params)
        def atividade2 = new Atividade2(params)

        assert atividade2.save() != null

        params.id = atividade2.id

        def model = controller.edit()

        assert model.atividade2Instance == atividade2
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/atividade2/list'

        response.reset()

        populateValidParams(params)
        def atividade2 = new Atividade2(params)

        assert atividade2.save() != null

        // test invalid parameters in update
        params.id = atividade2.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/atividade2/edit"
        assert model.atividade2Instance != null

        atividade2.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/atividade2/show/$atividade2.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        atividade2.clearErrors()

        populateValidParams(params)
        params.id = atividade2.id
        params.version = -1
        controller.update()

        assert view == "/atividade2/edit"
        assert model.atividade2Instance != null
        assert model.atividade2Instance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/atividade2/list'

        response.reset()

        populateValidParams(params)
        def atividade2 = new Atividade2(params)

        assert atividade2.save() != null
        assert Atividade2.count() == 1

        params.id = atividade2.id

        controller.delete()

        assert Atividade2.count() == 0
        assert Atividade2.get(atividade2.id) == null
        assert response.redirectedUrl == '/atividade2/list'
    }
}
