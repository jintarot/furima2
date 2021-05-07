function price(){
  console.log("load")
const itemPrice = document.getElementById("item-price")

itemPrice.addEventListener("input",() => {
  const tax = document.getElementById("add-tax-price")
const profit = document.getElementById("profit")
  console.log(itemPrice.value)
  tax.innerHTML = `${itemPrice.value * 0.1}`
  profit.innerHTML =`${itemPrice.value - itemPrice.value * 0.1}`
});
};


window.addEventListener("load",price);