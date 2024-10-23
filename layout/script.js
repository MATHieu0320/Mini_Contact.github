const hamburger = document.getElementById("click");
const navbar = document.querySelector(".absolute");

hamburger.addEventListener("click", () => {
  navbar.classList.toggle("toggle");
});
