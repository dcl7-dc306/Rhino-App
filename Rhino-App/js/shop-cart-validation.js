const htmlElements = {
    inputCreditCard: document.querySelector("#txtCreditCard"),
    inputExpiration: document.querySelector("#txtExpiration"),
    inputCVC: document.querySelector("#txtCVC"),
    buttonCheckout: document.querySelector("#btnCheckout"),
}

const regex = {
    // acepted cards
    visaCard: /^4[0-9]{12}(?:[0-9]{3})?$|^4[0-9]{12}(?:[0-9]{3})?$/,
    masterCard: /^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}$/,

    // All -> visa, master card, diners club, discover, jcb, american express
    allCards: /^(?:4[0-9]{12}(?:[0-9]{3})?|(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|6(?:011|5[0-9]{2})[0-9]{12}|(?:2131|1800|35\d{3})\d{11})$/,
}

htmlElements.buttonCheckout.addEventListener("click", validate);



function validate() {
    if (htmlElements.inputCreditCard.value !== "" && htmlElements.inputExpiration.value !== "" && htmlElements.inputCVC.value !== "") {

        // validates Card Number
        fcardNumber = validateCardNumber(htmlElements.inputCreditCard.value);

        // validates Date
        fdate = validateDate(htmlElements.inputExpiration.value);

        // validates CVC
        fcvc = validateCVC(htmlElements.inputCVC.value);    

        if (!fcardNumber && !fdate && !fcvc) {
            alert("Checkout: Failed Transaction. Something is wrong with your card.");
        } else {
            alert("Checkout: Successful Transaction. Thank you!");
        }

    } else {
        alert("Checkout: Please enter your credit card details.");
        htmlElements.inputCreditCard.style.boxShadow = "0 0 0 2px red";
        htmlElements.inputExpiration.style.boxShadow = "0 0 0 2px red";
        htmlElements.inputCVC.style.boxShadow = "0 0 0 2px red";
    }
}

function validateCardNumber(num) {

    let number = num.replace(/[ -]+/g, "");

    if (regex.visaCard.test(number) || regex.masterCard.test(number)) {
        htmlElements.inputCreditCard.style.boxShadow = "0 0 0 2px green";
        return false;
    } else {
        htmlElements.inputCreditCard.style.boxShadow = "0 0 0 2px red";
        alert("Checkout: Please input a valid credit card number.")
        return false;
    }
}

function validateDate(date) {
    let edate;
    const regex = /^([0-9]{2}\/[0-9]{4})$/;

    if (regex.test(date)) {
        edate = date.split(/[ /]+/);

        const today = new Date();
        const expirationDate = new Date().setFullYear(edate[1], edate[0]);

        if (expirationDate < today) {
            htmlElements.inputExpiration.style.boxShadow = "0 0 0 2px red";
            alert("Checkout: Please input valid expiration date.");
            return false;
        } else {
            htmlElements.inputExpiration.style.boxShadow = "0 0 0 2px green";
            return false;
        }
    } else {
        alert("Checkout: Please input valid expiration date.");
        htmlElements.inputExpiration.style.boxShadow = "0 0 0 2px red";
        return false;
    }

}

function validateCVC(cvc) {
    const regex = /^([0-9]{3})$/;

    if (regex.test(cvc)) {
        htmlElements.inputCVC.style.boxShadow = "0 0 0 2px green";
        return true;
    } else {
        alert("Checkout: Please input CVC.");
        htmlElements.inputCVC.style.boxShadow = "0 0 0 2px red";
        return false;
    }
}


