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


const counter = document.querySelector(".counter-number");
async function updateCounter() {
    let response = await fetch(
        ""
    );
    let data = await response.json();
    counter.innerHTML = `👀 Views: ${data}`;
}
updateCounter();