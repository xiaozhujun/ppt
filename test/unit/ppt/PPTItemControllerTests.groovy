package ppt



import org.junit.*
import grails.test.mixin.*

@TestFor(PPTItemController)
@Mock(PPTItem)
class PPTItemControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/PPTItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.PPTItemInstanceList.size() == 0
        assert model.PPTItemInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.PPTItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.PPTItemInstance != null
        assert view == '/PPTItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/PPTItem/show/1'
        assert controller.flash.message != null
        assert PPTItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/PPTItem/list'

        populateValidParams(params)
        def PPTItem = new PPTItem(params)

        assert PPTItem.save() != null

        params.id = PPTItem.id

        def model = controller.show()

        assert model.PPTItemInstance == PPTItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/PPTItem/list'

        populateValidParams(params)
        def PPTItem = new PPTItem(params)

        assert PPTItem.save() != null

        params.id = PPTItem.id

        def model = controller.edit()

        assert model.PPTItemInstance == PPTItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/PPTItem/list'

        response.reset()

        populateValidParams(params)
        def PPTItem = new PPTItem(params)

        assert PPTItem.save() != null

        // test invalid parameters in update
        params.id = PPTItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/PPTItem/edit"
        assert model.PPTItemInstance != null

        PPTItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/PPTItem/show/$PPTItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        PPTItem.clearErrors()

        populateValidParams(params)
        params.id = PPTItem.id
        params.version = -1
        controller.update()

        assert view == "/PPTItem/edit"
        assert model.PPTItemInstance != null
        assert model.PPTItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/PPTItem/list'

        response.reset()

        populateValidParams(params)
        def PPTItem = new PPTItem(params)

        assert PPTItem.save() != null
        assert PPTItem.count() == 1

        params.id = PPTItem.id

        controller.delete()

        assert PPTItem.count() == 0
        assert PPTItem.get(PPTItem.id) == null
        assert response.redirectedUrl == '/PPTItem/list'
    }
}
