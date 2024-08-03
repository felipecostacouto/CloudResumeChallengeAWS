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
    try {
        let response = await fetch("", {
            method: 'POST'
        });

        // Check if the response is OK
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        // Parse the response JSON
        let data = await response.json();
        console.log('API Response:', data); // Log the response data

        // Use the response body directly
        if (typeof data.body === 'number') {
            counter.innerHTML = `👀 Views: ${data.body}`;
        } else {
            throw new Error('Invalid data format in body');
        }
    } catch (error) {
        console.error('Error fetching views:', error);
        counter.innerHTML = `👀 Views: Error (${error.message})`;
    }
}

// Call the updateCounter function when the page loads
document.addEventListener('DOMContentLoaded', updateCounter);
