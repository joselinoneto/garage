window.sendProduct = function(title, quantity) {
    var products = [
        { title: title, quantity: quantity },
    ];

    Telegram.WebApp.sendData(JSON.stringify(products));
}
