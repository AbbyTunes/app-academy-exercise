
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

const dogLinkCreator = function (dogs) {
  let dogLinks = [];
  const dogKeys = Object.keys(dogs);
  // const dogValues = Object.values(dogs);
  
  for (let i = 0; i < dogKeys.length; i++) {

    let aTag = document.createElement("a");
    aTag.innerHTML = dogKeys[i];
    aTag.href = dogs[dogKeys[i]]; // dogValues[i];
    aTag.id = `dogs-${i}`;
    // <a href=""></a>

    let liTag = document.createElement("li");
    liTag.classList = "dog-link"; // cannot do class or addClass
    liTag.appendChild(aTag);
    dogLinks.push(liTag);
  }
  return dogLinks;
};

const attachDogLinks = function () {
  const dogLinks = dogLinkCreator(dogs);
  const dropDown = document.querySelector(".drop-down-dog-list");
  for (i = 0; i < dogLinks.length; i++) {
    dropDown.appendChild(dogLinks[i]);
  }
};

attachDogLinks();

const handleLeave = function() {
  const hide = document.querySelectorAll('.dog-link');
  for (i = 0; i < hide.length; i++) {
    hide[i].classList.remove("dog-link-hide");
  }
};

const handleEnter = function() {
  const show = document.querySelectorAll('.dog-link'); // html
  for (i = 0; i < show.length; i++) {
    show[i].classList.add("dog-link-hide");
  }
};

const dropDown = document.querySelector(".drop-down-dog-nav");
dropDown.addEventListener('mouseenter', handleEnter);
dropDown.addEventListener('mouseleave', handleLeave); 