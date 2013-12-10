package sisap



import org.junit.*
import grails.test.mixin.*

@TestFor(MensagemDestinatarioController)
@Mock(MensagemDestinatario)
class MensagemDestinatarioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/mensagemDestinatario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.mensagemDestinatarioInstanceList.size() == 0
        assert model.mensagemDestinatarioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.mensagemDestinatarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.mensagemDestinatarioInstance != null
        assert view == '/mensagemDestinatario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/mensagemDestinatario/show/1'
        assert controller.flash.message != null
        assert MensagemDestinatario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/mensagemDestinatario/list'

        populateValidParams(params)
        def mensagemDestinatario = new MensagemDestinatario(params)

        assert mensagemDestinatario.save() != null

        params.id = mensagemDestinatario.id

        def model = controller.show()

        assert model.mensagemDestinatarioInstance == mensagemDestinatario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/mensagemDestinatario/list'

        populateValidParams(params)
        def mensagemDestinatario = new MensagemDestinatario(params)

        assert mensagemDestinatario.save() != null

        params.id = mensagemDestinatario.id

        def model = controller.edit()

        assert model.mensagemDestinatarioInstance == mensagemDestinatario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/mensagemDestinatario/list'

        response.reset()

        populateValidParams(params)
        def mensagemDestinatario = new MensagemDestinatario(params)

        assert mensagemDestinatario.save() != null

        // test invalid parameters in update
        params.id = mensagemDestinatario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/mensagemDestinatario/edit"
        assert model.mensagemDestinatarioInstance != null

        mensagemDestinatario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/mensagemDestinatario/show/$mensagemDestinatario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        mensagemDestinatario.clearErrors()

        populateValidParams(params)
        params.id = mensagemDestinatario.id
        params.version = -1
        controller.update()

        assert view == "/mensagemDestinatario/edit"
        assert model.mensagemDestinatarioInstance != null
        assert model.mensagemDestinatarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/mensagemDestinatario/list'

        response.reset()

        populateValidParams(params)
        def mensagemDestinatario = new MensagemDestinatario(params)

        assert mensagemDestinatario.save() != null
        assert MensagemDestinatario.count() == 1

        params.id = mensagemDestinatario.id

        controller.delete()

        assert MensagemDestinatario.count() == 0
        assert MensagemDestinatario.get(mensagemDestinatario.id) == null
        assert response.redirectedUrl == '/mensagemDestinatario/list'
    }
}
