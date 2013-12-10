package sisap



import org.junit.*
import grails.test.mixin.*

@TestFor(TurmaDisciplinaController)
@Mock(TurmaDisciplina)
class TurmaDisciplinaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/turmaDisciplina/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.turmaDisciplinaInstanceList.size() == 0
        assert model.turmaDisciplinaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.turmaDisciplinaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.turmaDisciplinaInstance != null
        assert view == '/turmaDisciplina/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/turmaDisciplina/show/1'
        assert controller.flash.message != null
        assert TurmaDisciplina.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/turmaDisciplina/list'

        populateValidParams(params)
        def turmaDisciplina = new TurmaDisciplina(params)

        assert turmaDisciplina.save() != null

        params.id = turmaDisciplina.id

        def model = controller.show()

        assert model.turmaDisciplinaInstance == turmaDisciplina
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/turmaDisciplina/list'

        populateValidParams(params)
        def turmaDisciplina = new TurmaDisciplina(params)

        assert turmaDisciplina.save() != null

        params.id = turmaDisciplina.id

        def model = controller.edit()

        assert model.turmaDisciplinaInstance == turmaDisciplina
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/turmaDisciplina/list'

        response.reset()

        populateValidParams(params)
        def turmaDisciplina = new TurmaDisciplina(params)

        assert turmaDisciplina.save() != null

        // test invalid parameters in update
        params.id = turmaDisciplina.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/turmaDisciplina/edit"
        assert model.turmaDisciplinaInstance != null

        turmaDisciplina.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/turmaDisciplina/show/$turmaDisciplina.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        turmaDisciplina.clearErrors()

        populateValidParams(params)
        params.id = turmaDisciplina.id
        params.version = -1
        controller.update()

        assert view == "/turmaDisciplina/edit"
        assert model.turmaDisciplinaInstance != null
        assert model.turmaDisciplinaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/turmaDisciplina/list'

        response.reset()

        populateValidParams(params)
        def turmaDisciplina = new TurmaDisciplina(params)

        assert turmaDisciplina.save() != null
        assert TurmaDisciplina.count() == 1

        params.id = turmaDisciplina.id

        controller.delete()

        assert TurmaDisciplina.count() == 0
        assert TurmaDisciplina.get(turmaDisciplina.id) == null
        assert response.redirectedUrl == '/turmaDisciplina/list'
    }
}
