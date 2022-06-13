public with sharing class DummyPostCallout {

    //private static string GET_DUMMYPOST_ENDPOINT = CallOutInfo__mdt.getInstance('GET_DUMMYPOST').Endpoint__c;
    private static string HTTP_GET = 'GET';    
    private static string HTTP_POST = 'POST';

    public static void postCallout() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://dummyJson.com/posts');
        request.setMethod(HTTP_GET);

        http http = new http();
        HttpResponse response = http.send(request);        

        System.debug(response);
        if (response.getStatusCode() == 200) {
            System.debug(response.getBody());
            DummyPostResponseWrapper dummywrapper = (DummyPostResponseWrapper)JSON.deserialize(response.getBody(),DummyPostResponseWrapper.class);
            System.debug('dummy wrapper ' + dummywrapper); 

            List<Post__c> listPosts = new list<Post__c>();
            List<DummyPostResponseWrapper.Cls_Post> listClsPost = dummywrapper.posts;
            for(DummyPostResponseWrapper.Cls_Post dpost : listClsPost){
                Post__c p = new Post__c();
                p.ID__c = dpost.id;
                p.Title__c = dpost.title;
                p.Body__c = dpost.body;
                listPosts.add(p);
            }
            insert listPosts;

        }else {
            System.debug(response.getStatus());
        }
    }
}
