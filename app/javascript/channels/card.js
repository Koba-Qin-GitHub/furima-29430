const pay = () => {
  const payjp = Payjp('pk_test_***********************')// PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiry_monthElement = elements.create('cardExpiry');
  const expiry_yearElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#card-number');
  expiry_monthElement.mount('#card-exp-month');
  expiry_monthElement.mount('#card-exp-year');
  cvcElement.mount('#card-cvc');

  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);
