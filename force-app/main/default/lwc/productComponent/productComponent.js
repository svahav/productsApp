import { LightningElement, track } from 'lwc';
import getProducts from '@salesforce/apex/productsController.getProducts';

export default class ProductComponent extends LightningElement {
    @track result= [];
    @track oneImageOnly = false;
    connectedCallback(){
        this.getProductFromApi();
    }
    getProductFromApi(){
        getProducts().then(response=>{
            console.log(response);
            this.formatProductsData(response.products)
        }).catch(error=>{
            console.error(error);
        })
    }
    formatProductsData(res){
        this.result = res.map((product, index)=>{
            let id = `mew_${index+1}`;
            let price = product.price;
            let rating = product.rating;
            let showCarousel = product.images.length > 1;
            let mainImage = product.images[0];
            return{ ...product, id:id , price:price, rating:rating, showCarousel:showCarousel, mainImage:mainImage}
        })
    }
    nextSlide(event) {
        const card = event.target.closest('.card');
        const carousel = card.querySelector('.carousel');
        carousel.scrollLeft += carousel.offsetWidth;
    }
    
    prevSlide(event) {
        const card = event.target.closest('.card');
        const carousel = card.querySelector('.carousel');
        carousel.scrollLeft -= carousel.offsetWidth;
    }

    
}


