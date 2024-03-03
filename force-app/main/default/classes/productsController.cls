public with sharing class productsController {
    @AuraEnabled(cacheable=true)
    public static Map<String, Object> getProducts(){
        ProductsApiService productsApiService = new productsApiService();
        return productsApiService.getProductsFromApiService();
    }
    
}
