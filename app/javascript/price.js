function price(){
const input_price = document.getElementById("item-price");
input_price.addEventListener("input",()=>{
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  tax.innerHTML = `${price.value * 0.1}`
  const profit = document.getElementById("profit");
  profit.innerHTML = `${price.value - price.value * 0.1}`
})
};
window.addEventListener("load",price);