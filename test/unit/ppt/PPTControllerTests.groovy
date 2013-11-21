package ppt



import org.junit.*
import grails.test.mixin.*

@TestFor(PPTController)
@Mock(PPT)
class PPTControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/PPT/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.PPTInstanceList.size() == 0
        assert model.PPTInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.PPTInstance != null
    }

    void testSave() {
        controller.save()

        assert model.PPTInstance != null
        assert view == '/PPT/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/PPT/show/1'
        assert controller.flash.message != null
        assert PPT.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/PPT/list'

        populateValidParams(params)
        def PPT = new PPT(params)

        assert PPT.save() != null

        params.id = PPT.id

        def model = controller.show()

        assert model.PPTInstance == PPT
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/PPT/list'

        populateValidParams(params)
        def PPT = new PPT(params)

        assert PPT.save() != null

        params.id = PPT.id

        def model = controller.edit()

        assert model.PPTInstance == PPT
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/PPT/list'

        response.reset()

        populateValidParams(params)
        def PPT = new PPT(params)

        assert PPT.save() != null

        // test invalid parameters in update
        params.id = PPT.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/PPT/edit"
        assert model.PPTInstance != null

        PPT.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/PPT/show/$PPT.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        PPT.clearErrors()

        populateValidParams(params)
        params.id = PPT.id
        params.version = -1
        controller.update()

        assert view == "/PPT/edit"
        assert model.PPTInstance != null
        assert model.PPTInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/PPT/list'

        response.reset()

        populateValidParams(params)
        def PPT = new PPT(params)

        assert PPT.save() != null
        assert PPT.count() == 1

        params.id = PPT.id

        controller.delete()

        assert PPT.count() == 0
        assert PPT.get(PPT.id) == null
        assert response.redirectedUrl == '/PPT/list'
    }
}
