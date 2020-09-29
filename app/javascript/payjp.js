const pay =() =>  {
Payjp.setPublicKey("pk_test_ddc764a8f60054214391d9e5");
const form = document.getElementById("charge-form")
form.addEventListener("submit", (e) => {
  e.preventDefault();
  const formResult = document.getElementById("charge-form")
  const formData = new FormData(formResult);

   const card = {
    number: formData.get("pay_user_address[number]"),
    cvc: formData.get("pay_user_address[cvc]"),
    exp_month: formData.get("pay_user_address[exp_month]"),
    exp_year: `20${formData.get("pay_user_address[exp_year]")}`,
   };
   console.log(card)
   Payjp.createToken(card, (status, response) => {
     console.log(status)
     console.log(response)
     if (status == 200) {
      const token = response.id;
      const renderDom = document.getElementById("charge-form");
      const tokenObj = `<input value=${token} type="hidden" name='token'>`;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);
     }
     document.getElementById("card-number").removeAttribute("name");
     document.getElementById("card-cvc").removeAttribute("name");
     document.getElementById("card-exp_month").removeAttribute("name");
     document.getElementById("card-exp_year").removeAttribute("name");

     document.getElementById("charge-form").submit();
     document.getElementById("charge-form").reset();
   });
 });

}

window.addEventListener("load", pay);