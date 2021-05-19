function pay(){
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form1")
  form.addEventListener("submit",(e)=>{
    e.preventDefault()
    const form = document.getElementById("charge-form1")
    const formData = new FormData(form);
    console.log("111")
    const card = {
      number: formData.get("item_order[number]"),
      cvc: formData.get("item_order[cvc]"),
      exp_month: formData.get("item_order[month]"),
      exp_year: `20${formData.get("item_order[year]")}`
    }
    console.log(card)
    Payjp.createToken(card,(status,response) => {
      if(status === 200){
        const token = response.id
        const form = document.getElementById("charge-form1")
        const input = `<input value=${token} name='token' type="hidden"> `;
        form.insertAdjacentHTML("beforeend",input);

          document.getElementById("card-number").removeAttribute("name");
          document.getElementById("card-cvc").removeAttribute("name");
          document.getElementById("card-exp-month").removeAttribute("name");
          document.getElementById("card-exp-year").removeAttribute("name");

          document.getElementById("charge-form1").submit();
      };
    });

    
  })
}

window.addEventListener("load",pay)


