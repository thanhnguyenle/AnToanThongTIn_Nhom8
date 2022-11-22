const clickKA = document.querySelector("#clickKA");
const clickThanh = document.querySelector("#clickThanh");
const clickNhu = document.querySelector("#clickNhu");
const cClickKA = document.querySelector(".clickKA");
const cClickThanh = document.querySelector(".clickThanh");
const cClickNhu = document.querySelector(".clickNhu");

var count = 0;
const onClickChangeAd = (event) => {
    const temp = event.target.id;
    console.log(temp);
    if(count === 0 &&temp === "clickNhu"){
       cClickNhu.style.color='#000000';
       count++;
    }
    else if(temp === "clickNhu"){
      cClickNhu.style.color='#ffffff';
      count = 0;
    }
}

var count1 = 0;
const onClickChangeAd1 = (event) => {
    const temp = event.target.id;
    console.log(temp);
    if(count1 === 0 &&temp === "clickThanh"){
       cClickThanh.style.color='#000000';
       count1++;
    }
    else if(temp === "clickThanh"){
      cClickThanh.style.color='#ffffff';
      count1 = 0;
    }
  }

 var count2 = 0;
const onClickChangeAd2 = (event) => {
    const temp = event.target.id;
    console.log(temp);
    if(count2 === 0 &&temp === "clickKA"){
       cClickKA.style.color='#000000';
       count2++;
    }
    else if(temp === "clickKA"){
      cClickKA.style.color='#ffffff';
      count2 = 0;
    }
  }

clickKA.addEventListener("click", onClickChangeAd2);
clickNhu.addEventListener("click", onClickChangeAd);
clickThanh.addEventListener("click", onClickChangeAd1);

