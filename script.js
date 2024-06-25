// Typed.js initialization
var typed = new Typed('#typed', {
    strings: ["DevOps Student.", "Learner.", "Cloud Enthusiast."],
    typeSpeed: 50,
    backSpeed: 50,
    loop: true
});

var typed2 = new Typed('#typed_2', {
    strings: ["DevOps Student.", "Learner.", "Cloud Enthusiast."],
    typeSpeed: 50,
    backSpeed: 50,
    loop: true
});

document.addEventListener('DOMContentLoaded', function() {
    const menuToggle = document.querySelector('.menu-toggle');
    const navbarMenu = document.querySelector('.navbar-menu');

    menuToggle.addEventListener('click', function() {
        navbarMenu.classList.toggle('active'); // Toggle visibility
    });
});



const counter = document.querySelector(".counter-number");
async function updateCounter() {
    let response = await fetch(
        ""
    );
    let data = await response.json();
    counter.innerHTML = `👀 Views: ${data}`;
}
updateCounter();