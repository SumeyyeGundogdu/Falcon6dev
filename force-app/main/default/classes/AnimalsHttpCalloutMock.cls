@isTest
public class AnimalsHttpCalloutMock implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest request) {
        // create a fake response
        HTTPResponse response = new HTTPResponse();
        response.setHeader('Contect Type', 'application/json'); 
        response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}');
        response.setStatusCode(200);
        return response;
    }
}
