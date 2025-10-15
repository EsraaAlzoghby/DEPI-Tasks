// Initial setup
let balance = 1500;
/****/
// Default PIN is 4321 — this is the number you should enter on the login page
/****/
// If there's no PIN in localStorage, set a default one
if (!localStorage.getItem("atmPin")) {
  localStorage.setItem("atmPin", "4321");
}

function authenticateUser() {
  const pinInput = document.getElementById("userPin").value.trim();
  const errorMsg = document.getElementById("loginError");
  const savedPin = localStorage.getItem("atmPin");

  if (pinInput === savedPin) {
    // Successful login
    document.getElementById("loginSection").classList.add("d-none");
    document.getElementById("dashboard").classList.remove("d-none");
    errorMsg.innerText = "";
  } else {
    // Wrong PIN
    errorMsg.innerText = "Incorrect PIN!";
  }
}

function showBalance() {
  alert(`Your current balance is ${balance} EGP.`);
}

function makeDeposit() {
  const amount = parseFloat(prompt("Enter the amount to deposit:"));
  if (!isNaN(amount) && amount > 0) {
    balance += amount;
    updateUI();
    alert(` ${amount} EGP has been deposited successfully!`);
  } else {
    alert(" Please enter a valid amount!");
  }
}

function makeWithdraw() {
  const amount = parseFloat(prompt("Enter the amount to withdraw:"));
  if (!isNaN(amount) && amount > 0) {
    if (amount <= balance) {
      balance -= amount;
      updateUI();
      alert(` You have withdrawn ${amount} EGP successfully!`);
    } else {
      alert(" Insufficient balance!");
    }
  } else {
    alert(" Please enter a valid amount!");
  }
}

function signOut() {
  document.getElementById("dashboard").classList.add("d-none");
  document.getElementById("loginSection").classList.remove("d-none");
  document.getElementById("userPin").value = "";
  document.getElementById("loginError").innerText = "";
}

function togglePin() {
  const pinField = document.getElementById("userPin");
  const eye = document.getElementById("eyeIcon");
  if (pinField.type === "password") {
    pinField.type = "text";
    eye.classList.replace("bi-eye", "bi-eye-slash");
  } else {
    pinField.type = "password";
    eye.classList.replace("bi-eye-slash", "bi-eye");
  }
}

function updateUI() {
  document.getElementById("currentAmount").innerText = balance;
}
