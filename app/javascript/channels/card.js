const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);// ←  PAY.JPテスト公開鍵
  // PAY.JPが設定しているフォームのtypeを指定し、入力フォームを作成
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');


  // 指定したid属性の要素とフォームを置き換える
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');



  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    e.preventDefault();
    // トークン化の処理
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();

    });
  });
};

window.addEventListener("load", pay);

