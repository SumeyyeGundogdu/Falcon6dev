@isTest
public with sharing class AnimalsCalloutsTest {
    @isTest
    private static void testFetcAnimalsSuccess() {
        AnimalsHttpCalloutMock am = new AnimalsHttpCalloutMock();
        Test.setMock(HttpCalloutMock.class, am );
        AnimalsCallOuts.fetchAnimals();
        Test.startTest();
        HttpResponse response =AnimalsCallOuts.fetchAnimals2();
        Test.stopTest();
        system.assertEquals(200, response.getStatusCode());
    }
    @isTest
    private static void testFetcAnimalsFailure() {
        AnimalsHttpMockCalloutFailure am = new AnimalsHttpMockCalloutFailure();
        Test.setMock(HttpCalloutMock.class, am );

        Test.startTest();
        HttpResponse response =AnimalsCallOuts.fetchAnimals2();
        Test.stopTest();
        system.assertEquals(404, response.getStatusCode());
    }
}
