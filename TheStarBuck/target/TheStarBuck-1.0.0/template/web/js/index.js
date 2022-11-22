const starbucks = document.querySelector(".starbucks");
const circle = document.querySelector(".circle");
const menuToggle = document.querySelector(".imgBox");
const navigation = document.querySelector(".navigation");

const mySwiper = document.querySelector(".mySwiper");

function toggleMenu() {
  menuToggle.classList.toggle("active");
  navigation.classList.toggle("active");
}


menuToggle.addEventListener("click", toggleMenu);





var swiper = new Swiper(mySwiper, {
  effect: "coverflow",
  grabCursor: true,
  centeredSlides: true,
  slidesPerView: "auto",
  coverflowEffect: {
    rotate: 60,
    stretch: 0,
    depth: 100,
    modifier: 1,
    slideShadows: true,
  },
  pagination: {
    el: ".swiper-pagination",
  },
});

//  audio

const component_bell = document.querySelector('.banner__decor');
const audio = new Audio("music/baner_decor.mp3")

const playM = async () => {
  await audio.play();
}
component_bell.addEventListener('mouseenter', playM);



$(document).ready(function () {
  $(".image-slider").slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    infinite: true,
    arrows: true,
    draggable: false,
    prevArrow: `<button type='button' class='slick-prev slick-arrow'><i class="fa-solid fa-arrow-left"></i></button>`,
    nextArrow: `<button type='button' class='slick-next slick-arrow'><i class="fa-solid fa-arrow-right"></i></button>`,
    dots: true,
    responsive: [
      {
        breakpoint: 1025,
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          arrows: false,
          infinite: false,
        },
      },
    ],
    autoplay: true,
    autoplaySpeed: 1200,
  });
});

$(document).ready( () => {

});

const  searchBar = () => {
  // alert('bchdsbjsd');
  $('#ipSearch').change(() => {
    // alert("jcdsndsnj");
    console.log($('#ipSearch').val());
    $.ajax({
      method: "POST",
      url: "searchAjax?product_search="+$('#ipSearch').val(),
      // data: { name: "John", location: "Boston" }
      success: function (data) {
        $('.search_container').append(JSON.parse(data));
        console.log(JSON.parse(data))
      }
    })
    // .done(function( msg ) {
    //   alert( "Data Saved: " + msg );
    // });
  });
}
