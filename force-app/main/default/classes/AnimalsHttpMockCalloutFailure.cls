@isTest
public with sharing class AnimalsHttpMockCalloutFailure implements HttpCalloutMock {
   public HttpResponse respond(HttpRequest request){
       HttpResponse response = new HttpResponse();
       response.setHeader('Contect-Type', 'apllication/json');
       response.setStatusCode(404);
       return response;
   }

}
