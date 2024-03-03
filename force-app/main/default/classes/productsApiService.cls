public with sharing class productsApiService {
  
    // Method to fetch news data
    public Map<String, Object> getProductsFromApiService() {
        String response = sendHttpRequest();
        return deserializeResponse(response);
    }

    // Private method to send HTTP request and get response
    private String sendHttpRequest() {
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setEndpoint('https://dummyjson.com/products/category/smartphones');
        httpRequest.setMethod('GET');

        HttpResponse httpResponse;
        String strResponse = '';

        try {
            Http http = new Http();
            httpResponse = http.send(httpRequest);
            
            if (httpResponse.getStatusCode() == 200) {
                strResponse = httpResponse.getBody();
            } else {
                throw new CalloutException('HTTP Error: ' + httpResponse.getStatusCode() + ' ' + httpResponse.getStatus());
            }
        } catch (Exception ex) {
            throw new CalloutException('An unexpected error occurred: ' + ex.getMessage());
        }

        return strResponse;
    }

    // Private method to deserialize response and handle articles
    private Map<String, Object> deserializeResponse(String response) {
        Map<String, Object> productsJsonData = (Map<String, Object>) JSON.deserializeUntyped(response);
        
        if (productsJsonData.containsKey('products')) {
            List<Object> products = (List<Object>) productsJsonData.get('products');
          
        }

        return productsJsonData;
    }

}