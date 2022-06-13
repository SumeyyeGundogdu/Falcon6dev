public with sharing class AnimalsCallOuts {

    private static String GET_ANIMALS_ENDPOINT = CallOutInfo__mdt.getInstance('GET_ANIMALS').Endpoint__c;
    private static String POST_ANIMALS_ENDPOINT = CallOutInfo__mdt.getInstance('POST_ANIMALS').Endpoint__c;
    private static string HTTP_GET = 'GET';
    private static string HTTP_POST = 'POST';

    public static void fetchAnimals() {
        // 1.prepare request
        HttpRequest request = new HttpRequest();
        request.setEndPoint(GET_ANIMALS_ENDPOINT);
        request.setMethod(HTTP_GET);
        // 2.prepare http
        http http = new http();        
        HttpResponse response = http.send(request);
        System.debug('status ' + response.getStatus());
        System.debug('status code '+ response.getStatusCode());
        // 4.process the responce 
        if (response.getStatusCode()==200) {
            string animalsJSON = response.getBody();
            System.debug(animalsJSON);


            object ob = JSON.deserializeUntyped(animalsJSON);
            Map<String,Object> result = (Map<String,Object>)ob;

            List<object> animals = (List<object>) result.get('animals');
            system.debug('======object animals list start======');
            for (object a : animals) {
                System.debug(a);
            }

            System.debug('======object animals list END==========');

        }else {
        // NOT SUCCESS.
        System.debug('something went wrong people');
        }

    }


    public static HttpResponse fetchAnimals2() {
        // 1.prepare request
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        // 2.prepare http
        http http = new http();
        // 3.Send request, which returns response
        HttpResponse response = http.send(request);
        System.debug('status ' + response.getStatus());
        System.debug('status code '+ response.getStatusCode());
        // 4.process the responce 
        if (response.getStatusCode()==200) {
            AnimalsCalloutResponse animalResponse  = (AnimalsCalloutResponse)JSON.deserialize(response.getBody(), AnimalsCalloutResponse.class);
            System.debug('======string animals list START========');
            List<String> animalList = animalResponse.animals;
            for (string a : animalList) {
                System.debug(a);
            }
            System.debug('======string animals list END========');

        }else {
        // NOT SUCCESS.
        string result = 'failed';
        System.debug('something went wrong people');
        }
        return response;

    }

   

    public static HttpResponse postAnimal(){
        HttpRequest request = new HttpRequest();
        request.setEndpoint(POST_ANIMALS_ENDPOINT);
        request.setMethod(HTTP_POST);
        string jsonReq = ('{"name":"Fluffykins"}');
        request.setBody(jsonReq);
        request.setHeader('Content-Type', 'application/json');
        
        
        Http Http = new Http();

        HttpResponse response = Http.send(request);
        if (response.getStatusCode()==201) {
            AnimalsCalloutResponse animalsResponse = (AnimalsCalloutResponse)Json.deserialize(response.getBody(), animalsCalloutResponse.class);
            System.debug('=========String Animal list start=========');
            list<string> allAnimals = animalsResponse.animals;
            for (string a : allAnimals) {
                System.debug(a);
            }
            System.debug('=====string animals List END=====');
        }else {
            System.debug(' Sometihing Went Rong');
        }
        return response;
    }
}
