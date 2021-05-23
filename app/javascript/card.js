function card(){
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
const charge = document.getElementById("charge-form");

charge.addEventListener("submit",(e)=>{
  e.preventDefault();
  const charge = document.getElementById("charge-form");
  const formData = new FormData(charge)
  const card = {
    number: formData.get("number"),
    cvc: formData.get("cvc"),
    exp_month: formData.get("month"),
    exp_year: `20${formData.get("year")}`
  }
  console.log(card)
  Payjp.createToken(card,(status,response)=>{
    if(status == 200){
    
      const token = response.id
      const form = document.getElementById("charge-form");
      const input= `<input value=${token} name='token' type="hidden"> `;
      form.insertAdjacentHTML("beforeend",input);

      document.getElementById("number").removeAttribute("name");
      document.getElementById("cvc").removeAttribute("name");
      document.getElementById("month").removeAttribute("name");
      document.getElementById("year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    }
  })
})
};
window.addEventListener("load",card);