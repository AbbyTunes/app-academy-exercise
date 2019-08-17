
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    
    let p = document.createElement("p");
    p.innerHTML = string;
    
    let childArr = htmlElement.children;
    if (childArr) {
        for (let i = 0; i < childArr.length; i++) {
            htmlElement.removeChild(childArr[i]);
        }
    }
    
    htmlElement.appendChild(p);
};

htmlGenerator('Party Time.', partyHeader);
htmlGenerator("I <3 Vanilla DOM manipulation.", partyHeader);
