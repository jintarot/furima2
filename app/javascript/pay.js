function pay(){
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit",(e)=>{
    e.preventDefault();
    console.log(1)
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("member"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("month"),
      exp_year: `20${formData.get("year")}`
    }
    Payjp.createToken(card,(status,response)=>{
      console.log(2)
      if(status == 200){
        const token = response.id
        document.getElementById("card-number").removeAttribute('name')
        document.getElementById("card-exp-month").removeAttribute('name')
        document.getElementById("card-exp-year").removeAttribute('name')
        document.getElementById("card-cvc").removeAttribute('name')
        const formObj = document.getElementById("charge-form");
        const input = `<input value=${token} name='token' type="hidden">`
        formObj.insertAdjacentHTML("beforeend",input);

        

        document.getElementById("charge-form").submit();
      }
    })
  })
}
window.addEventListener("load",pay);