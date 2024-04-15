// Initialize an empty cart
var cart = [];
var localProducts = [];

window.sendProduct = function() {
    var products = [];

    for(var i in cart) {
        let id = cart[i].id;
        let product = localProducts.find((product) => product.id == id);
        let count = cart[i].count;
        let payloadProduct = new Product(id, product.title, count);
        products.push(payloadProduct);
    }

    Telegram.WebApp.sendData(JSON.stringify(products));
}

window.addProductCart = function(products, id) {
    localProducts = products

    for(var item in cart) {
        if(cart[item].id === id) {
          cart[item].count ++;
          saveCart();
          reloadData();
          return;
        }
    }

    var item = new Item(id, 1);
    cart.push(item);
    saveCart();
    reloadData();
};

window.removeItemCart = function(id) {
    for(var item in cart) {
        if(cart[item].id === id) {
          cart[item].count --;
          saveCart();
          reloadData();
          if(cart[item].count === 0) {
            cart.splice(item, 1);
          }
          break;
        }
    }
};

window.clearCart = function() {
    clearData();
    sessionStorage.removeItem("shoppingCart");
    cart = [];
    localProducts = [];
    reloadData();
}

window.onload = function() {
    reloadData()
}

class Item {
    constructor(id, count) {
        this.id = id;
        this.count = count;
    }
}

class Product {
    constructor(id, title, count) {
        this.id = id;
        this.title = title;
        this.count = count;
    }
}

function saveCart() {
    sessionStorage.setItem('shoppingCart', JSON.stringify(cart));
}
  
function loadCart() {
    cart = JSON.parse(sessionStorage.getItem('shoppingCart'));
    if (cart == null) {
        cart = [];
    }
}

function reloadData() {
    loadCart();
    for(var item in cart) {
        var elementId = "product-".concat(cart[item].id);
        var element = document.getElementById(elementId);
        element.innerHTML = cart[item].count;
    }
}

function clearData() {
    for(var item in cart) {
        var elementId = "product-".concat(cart[item].id);
        var element = document.getElementById(elementId);
        element.innerHTML = 0;
    }
}
