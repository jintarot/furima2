function pay(){
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form1")
  form.addEventListener("submit",()=>{
    const form = document.getElementById("charge-form1")
    const formData = new FormData(form);
    const card = {
      number: formData.get("item_order[number]"),
      exp_month: `20${formData.get("item_order[month]")}`,
      exp_year: formData.get("item_order[year]"),
      cvc: formData.get("item_order[cvc]")
    }
    Payjp.createToken(card,(status,response) => {
      if(status === 200){
        const token = response.id
        const form = document.getElementById("charge-form1")
        const input = `<input value=${token} type="hidden">`
        form.insertAdjacentHTML("beforeend",input);

        document.getElementById("card-number").removeAttribute("name");
          document.getElementById("card-cvc").removeAttribute("name");
          document.getElementById("card-exp-month").removeAttribute("name");
          document.getElementById("card-exp-year").removeAttribute("name");

          document.getElementById("charge-form").submit();
      }
    })

    
  })
}

window.addEventListener("load",pay)