function price(){
  console.log("aaa")
  // 画面が読み込まれた時に動くように定義する
   const priceInput = document.getElementById("item-price");
   const add_tax = document.getElementById("add-tax-price");//販売手数料
   const profit = document.getElementById("profit");//販売利益
   const pullDownChild = document.querySelectorAll(".price-content")
   // 価格入力時に手数料、利益計算
     priceInput.addEventListener('keyup', () => {
         const value = priceInput.value; //value（入力の金額を定義）
         console.log(value)
         
       if (value >= 300 && value <= 9999999){
         let fee = Math.floor(value * 0.1)
         console.log(fee)
         let gains = Math.floor(value - fee)
         console.log(gains)
         add_tax.textContent = fee;
         profit.textContent = gains;
     } else {
       let fee = '-';
       let gains = '-';
       add_tax.textContent = fee;
       profit.textContent = gains;
     }
   });
  pullDownChild.forEach(function(price){
    price.addEventListener('input', function(){
      console.log(price)
    })
  })
  }
  window.addEventListener('load', price);