const xsltProcessor = new XSLTProcessor();

let request = new XMLHttpRequest();
request.open("GET", "filter.xslt", false);
request.send(null);

const xslStylesheet = request.responseXML;
xsltProcessor.importStylesheet(xslStylesheet);

request = new XMLHttpRequest();
request.open("GET", "message.xml", false);
request.send(null);

xmlDoc = request.responseXML;

const xmlRef = document.implementation.createDocument("", "", null);
const fragment = xsltProcessor.transformToFragment(xmlDoc, xmlRef);

const div = document.createElement("output");
div.appendChild(fragment.cloneNode(true));
console.log(div.innerHTML);

const output = document.getElementById("output");
output.innerText = div.innerHTML;