// This is the placeholder that will be replaced with the actual API URL
const apiUrl = "YOUR_API_URL_HERE";

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
        let response = await fetch(apiUrl, {
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
            counter.innerHTML = `👀 this page has been viewed ${data.body} times.`;
        } else {
            throw new Error('Invalid data format in body');
        }
    } catch (error) {
        console.error('Error fetching views:', error);
        counter.innerHTML = `👀 this page has been viewed Error (${error.message}) times.`;
    }
}

// Call the updateCounter function when the page loads
document.addEventListener('DOMContentLoaded', updateCounter);
