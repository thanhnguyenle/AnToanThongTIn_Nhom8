const starbucks = document.querySelector(".starbucks");
const thumb1 = document.querySelector("#thumb1");
const thumb2 = document.querySelector("#thumb2");
const thumb3 = document.querySelector("#thumb3");
const starbuckAv = document.querySelector("#starbuckAv");
const circle = document.querySelector(".circle");
const menuToggle = document.querySelector(".imgBox");
const navigation = document.querySelector(".navigation");

function imgSlider(event) {
    const temp = event.target.id;
    if (temp === thumb1.id) {
        starbuckAv.src = "images/img1.png";
        circle.style.backgroundColor = "#017143";
    } else if (temp === thumb2.id) {
        starbuckAv.src = "images/img2.png";
        circle.style.backgroundColor = "#eb7495";
    } else if (temp === thumb3.id) {
        starbuckAv.src = "images/img3.png";
        circle.style.backgroundColor = "#d752b1";
    }

}

function toggleMenu() {
    menuToggle.classList.toggle("active");
    navigation.classList.toggle("active");
}

thumb1.addEventListener("click", imgSlider);
thumb2.addEventListener("click", imgSlider);
thumb3.addEventListener("click", imgSlider);
menuToggle.addEventListener("click", toggleMenu);
